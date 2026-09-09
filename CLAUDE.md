# Testing the CUE Preprocessor

<!-- The CUE project common guidance is imported below, managed
     by cueckoo. If the referenced file is missing on your
     machine, run "cueckoo version update" to write it (and
     pick up any newer cueckoo while you are at it). -->
@~/.cache/cueckoo/common-guidance.md

## Project-specific instructions

This document captures key insights about testing the CUE preprocessor,
based on experience working with the codebase.

## Test Structure and Location

All tests for the preprocessor live in
`internal/cmd/preprocessor/cmd/testdata/` and follow the
[testscript](https://pkg.go.dev/github.com/rogpeppe/go-internal/testscript) format.

### Test File Naming Convention

Test files use the `.txtar` extension and typically follow this naming
pattern:
- `execute_<scenario>.txtar` - for successful execution tests
- `execute_err_<scenario>.txtar` - for tests that expect errors

### Running Tests

```bash
# Run all preprocessor tests
go test github.com/cue-lang/cuelang.org/internal/cmd/preprocessor/cmd

# Run a specific test
go test -run TestScript/<test_name> github.com/cue-lang/cuelang.org/internal/cmd/preprocessor/cmd

# Run with verbose output to see execution details
go test -run TestScript/<test_name> -v github.com/cue-lang/cuelang.org/internal/cmd/preprocessor/cmd

# Update golden output files when preprocessor behavior changes
CUE_UPDATE=1 go test github.com/cue-lang/cuelang.org/internal/cmd/preprocessor/cmd
```

### Golden Output Updates

When making changes to the preprocessor that affect test output, you may
need to update the golden files in the test data. This codebase uses a
convention where setting the `CUE_UPDATE` environment variable enables
updating golden output files during test runs.

**When to use `CUE_UPDATE=1`:**
- After making changes to preprocessor logic that modify output format
- When error messages or validation behavior changes
- After adding new features that generate different output

**Critical:** After updating golden files, always ensure `go test ./...`
passes for each commit. The CI pipeline requires all tests to pass, so
golden file updates must be committed along with the changes that
necessitated them.

## Test Structure

Each `.txtar` test file contains:
1. **Comments** describing the test purpose
2. **Test commands** using testscript syntax
3. **File contents** that the test operates on

Example structure:
```
# Test that mkdocs mode errors with code blocks
# Ensure that we get a sensible error when using code blocks in
# mkdocs-output mode

unquote content/example/en.md

# Create output directory
mkdir output

# Run the preprocessor - this should error
! exec preprocessor execute --mkdocs-output=output
stderr 'with code.*blocks are not supported in --mkdocs-output mode'

-- content/example/site.cue --
package site
...

-- content/example/en.md --
>---
>title: Test
>---
>
>{{{with code "en" "test"}}}
>{{{end}}}
```

## Key Testing Patterns

### Error Testing
- Use `!` prefix before commands that should fail
- Use `stderr '<pattern>'` to match expected error messages
- Error patterns support regex matching

### File Setup
- Use `unquote` to process files with `>` prefixes
- Create necessary directory structure with `mkdir`
- Files are defined at the bottom using `-- filename --` syntax

### Content Processing
- Files with `>` prefixes need `unquote` processing
- This allows embedding Hugo frontmatter and template syntax in test
  files

## Parse-Time vs Execution-Time Validation

The preprocessor has two main phases where validation can occur:

### Parse-Time Validation (Preferred)
- Occurs during template parsing in `parse.go`
- Fails fast before any processing begins
- Example: Checking if code nodes are allowed in mkdocs mode
- Implementation: Add validation in the node creation switch
  statement

### Execution-Time Validation
- Occurs during node execution in the `validate()` methods
- Happens after parsing but before content generation
- Less efficient as more setup has occurred

## Common Testing Scenarios

### Mode-Specific Restrictions
Test different output modes (hugo vs mkdocs) and their specific
limitations:
```bash
! exec preprocessor execute --mkdocs-output=output
stderr 'blocks are not supported in --mkdocs-output mode'
```

### Multi-File vs Single-File Content
Test behavior with different file structures in code blocks.

### Template Syntax Validation
Ensure proper error reporting for malformed template syntax.

## Best Practices

1. **Clear test names** - Use descriptive names that explain the scenario
2. **Comprehensive comments** - Document what the test validates
3. **Minimal test cases** - Include only necessary files and content
4. **Specific error patterns** - Match exact error messages expected
5. **Fast failure** - Prefer parse-time validation over execution-time
   when possible

## Debugging Tests

When tests fail:
1. Run with `-v` flag to see detailed execution
2. Check the `WORK=$WORK` output to see temporary files
3. Error messages show exact line numbers for parse-time errors
4. Use `stderr` patterns to verify expected error messages

## Integration with CI/CD

Tests run automatically in the CI pipeline and must pass before changes
are merged. The testscript format ensures consistent, reproducible test
execution across different environments.

## Fixing tip.cuelang.org

tip.cuelang.org is the site built against the tip of cue-lang/cue by the
"tip deploy" workflow in `internal/ci/github/tipdeploy.cue`, while the
site itself stays on a released CUE version. When cue-lang/cue changes in
a way that breaks that build, the fix goes in `internal/patch/tip.diff`, a
patch that CI applies on top of master before building.

### How the tip build works

1. `_scripts/tipPatchApply.bash` applies `internal/patch/tip.diff` to a
   clean tree.
2. `_scripts/tipUseAlternativeCUE.bash <sha>` resolves the cue-lang/cue
   commit to a pseudo-version and writes `tip.cue`, which overrides every
   CUE version in `site.cue`.
3. `_scripts/regenPostInfraChange.bash` regenerates, builds the docker
   image, runs the Go tests, then runs the preprocessor over all content
   with `--update`.
4. `_scripts/tipDeploy.bash` commits the resulting tree, including the
   regenerated page outputs and cache files, to the `tip` branch.

Because step 4 commits whatever the build produces, the patch only needs
the source changes that make pages build: rewritten CUE, `#nofmt` tags,
hidden `_script_` steps and the like. It never needs regenerated outputs,
`gen_cache.cue` files, `hugo/content`, or generated files such as
`tip.cue`, `playground/go.mod` or the Dockerfile.

### Reproducing a failure locally

The CI log for the "Build the site against the tip" step stops at the
first failing stage, typically the Go tests, so it does not show how many
pages are affected. Run the full flow locally, starting from a clean
tree:

```bash
_scripts/tipPatchApply.bash
_scripts/tipUseAlternativeCUE.bash "$(git ls-remote https://github.com/cue-lang/cue refs/heads/master | cut -f1)"
go generate ./... && (cd playground && go generate ./...)
_scripts/buildDockerImage.bash
CUE_UPDATE=1 go test -run TestScripts/execute_multistagescript ./internal/cmd/preprocessor/cmd
go test ./... && (cd playground && go test ./...)
_scripts/runPreprocessor.bash execute --update
_scripts/runPreprocessor.bash execute
```

The preprocessor reports every failing page before exiting, so read its
whole output for the list of pages to fix. `TestServeScript` fails when
the local Hugo is newer than the version pinned in
`internal/ci/repo/repo.cue`; that failure is unrelated to tip.

### Fixing pages

- The preprocessor formats every CUE file in a page with `cue fmt` at the
  tip version, whether or not the page sets up a module, so a syntax
  change in CUE breaks every page that still uses the old form.
  `#nofmt(file.cue)` on a `code` or `upload` block skips formatting a
  file that must keep the old syntax, and a hidden `_script_` step can
  run `cue mod init --language-version=vX.Y.Z` so that the page's
  commands still parse it.
- Only changes that need the tip version go in the patch. A change that
  also works on the site's current CUE version, such as pinning a
  module's language version, belongs on master: the patch has to be
  folded into master at the next CUE upgrade, so keep it small.
- Prefer the rewrites that `cue fix` would make, and try the tip version
  of `cue` on a small standalone example before editing pages. Build it
  with `go install cuelang.org/go/cmd/cue@<sha>` in a scratch module.

### Updating the patch

`_scripts/tipPatchGenerate.bash` writes the diff of the whole working
tree against HEAD to the patch, so run it from a tree that holds only
the applied patch and the new source edits: not `tip.cue`, the outputs
regenerated by `--update`, or the generated Go and docker files. Once
the edits are validated with the flow above, save them, reset, and
rebuild that tree:

```bash
git diff --src-prefix=a/ --dst-prefix=b/ HEAD -- <edited paths> >edits.diff
git reset --hard && rm -f tip.cue
_scripts/tipPatchApply.bash
git apply edits.diff
_scripts/tipPatchGenerate.bash
```

Then restore everything but the patch, and confirm that it applies; this
check runs on every CL in the trybots, so a patch that fails it fails CI:

```bash
git checkout HEAD -- . ':^internal/patch/tip.diff'
git apply --check --index internal/patch/tip.diff
```

Commit only `internal/patch/tip.diff` to master. Split a large change
into a stack, for example tests first, then mechanical page rewrites,
then pages that need judgement, keeping each commit's patch applicable
on its own.

## Commit Message Guidelines

When making changes to the preprocessor:

- **No AI authorship attribution** - Don't include co-author lines or
  mentions of AI assistance in commit messages
- **Focus on technical changes** - Commit messages should describe what
  was changed and why
- **Use appropriate prefixes** - Follow project conventions (e.g.,
  `preprocessor:`, `docs:`)
- **Keep it clean** - Commit messages should be professional and focused
  on the code changes

### Cache Management with Trailers

Changes to the preprocessor, or to the scripts in a page, change the
`gen_cache.cue` files under `content/`. If only a few cache files change,
commit them together with the change that caused them; a separate commit
is not necessary.

When a change causes large cache churn, keep the noise out of the change
itself with two commits:

1. **Initial commit with changes** - Add the
   `Preprocessor-No-Write-Cache: true` trailer to prevent cache file
   updates
   ```bash
   git commit -s --trailer 'Preprocessor-No-Write-Cache: true'
   ```

2. **Follow-up cache update commit** - After the preprocessor changes,
   run the preprocessor to update the `gen_cache.cue` files and commit
   them without the trailer
   ```bash
   CI=true ./_scripts/runPreprocessor.bash execute
   git add content/docs/*/gen_cache.cue
   git commit -s -m "content: regenerate cache"
   ```

The trailer tells CI not to update cache files while testing the change.
`runPreprocessor.bash` honors the trailer on HEAD locally too, so set
`CI=true` to write cache files anyway, as in the second step above.

**Important:** The `Preprocessor-No-Write-Cache: true` must be added as a
proper git trailer (after `Signed-off-by` and `Change-Id` lines), not as
part of the commit message body.

### Editing Commits in a Stack

When you need to edit a commit that's part of a commit stack (multiple
commits on a branch), always use the branchpoint for interactive rebase:

```bash
# Get the branchpoint for the current branch
git codereview branchpoint

# Start interactive rebase from the branchpoint
GIT_SEQUENCE_EDITOR="sed -i 'Ns/^pick/edit/'" git rebase -i $(git codereview branchpoint)
```

Where `N` is the line number of the commit you want to edit in the rebase
todo list (counting from 1).

**Example:** To edit the second commit in a 3-commit stack:
```bash
GIT_SEQUENCE_EDITOR="sed -i '2s/^pick/edit/'" git rebase -i $(git codereview branchpoint)
```

This ensures you're rebasing from the correct base and can safely edit
commits without breaking the commit stack or losing work.
