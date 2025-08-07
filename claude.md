# Testing the CUE Preprocessor

This document captures key insights about testing the CUE preprocessor, based on experience working with the codebase.

## Test Structure and Location

All tests for the preprocessor live in `internal/cmd/preprocessor/cmd/testdata/` and follow the [testscript](https://pkg.go.dev/github.com/rogpeppe/go-internal/testscript) format.

### Test File Naming Convention

Test files use the `.txtar` extension and typically follow this naming pattern:
- `execute_<scenario>.txtar` - for successful execution tests
- `execute_err_<scenario>.txtar` - for tests that expect errors

### Running Tests

```bash
# Run all preprocessor tests
go test github.com/cue-lang/cuelang.org/internal/cmd/preprocessor/cmd

# Run a specific test
go test -run TestScript/<test_name>

# Run with verbose output to see execution details
go test -run TestScript/<test_name> -v

# Update golden output files when preprocessor behavior changes
CUE_UPDATE=1 go test github.com/cue-lang/cuelang.org/internal/cmd/preprocessor/cmd
```

### Golden Output Updates

When making changes to the preprocessor that affect test output, you may need to update the golden files in the test data. This codebase uses a convention where setting the `CUE_UPDATE` environment variable enables updating golden output files during test runs.

**When to use `CUE_UPDATE=1`:**
- After making changes to preprocessor logic that modify output format
- When error messages or validation behavior changes  
- After adding new features that generate different output

**Critical:** After updating golden files, always ensure `go test ./...` passes for each commit. The CI pipeline requires all tests to pass, so golden file updates must be committed along with the changes that necessitated them.

## Test Structure

Each `.txtar` test file contains:
1. **Comments** describing the test purpose
2. **Test commands** using testscript syntax
3. **File contents** that the test operates on

Example structure:
```
# Test that mkdocs mode errors with code blocks
# Ensure that we get a sensible error when using code blocks in mkdocs-output mode

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
- This allows embedding Hugo frontmatter and template syntax in test files

## Parse-Time vs Execution-Time Validation

The preprocessor has two main phases where validation can occur:

### Parse-Time Validation (Preferred)
- Occurs during template parsing in `parse.go`
- Fails fast before any processing begins
- Example: Checking if code nodes are allowed in mkdocs mode
- Implementation: Add validation in the node creation switch statement

### Execution-Time Validation
- Occurs during node execution in the `validate()` methods
- Happens after parsing but before content generation
- Less efficient as more setup has occurred

## Common Testing Scenarios

### Mode-Specific Restrictions
Test different output modes (hugo vs mkdocs) and their specific limitations:
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
5. **Fast failure** - Prefer parse-time validation over execution-time when possible

## Debugging Tests

When tests fail:
1. Run with `-v` flag to see detailed execution
2. Check the `WORK=$WORK` output to see temporary files
3. Error messages show exact line numbers for parse-time errors
4. Use `stderr` patterns to verify expected error messages

## Integration with CI/CD

Tests run automatically in the CI pipeline and must pass before changes are merged. The testscript format ensures consistent, reproducible test execution across different environments.

## Commit Message Guidelines

When making changes to the preprocessor:

- **No AI authorship attribution** - Don't include co-author lines or mentions of AI assistance in commit messages
- **Focus on technical changes** - Commit messages should describe what was changed and why
- **Use appropriate prefixes** - Follow project conventions (e.g., `preprocessor:`, `docs:`)
- **Keep it clean** - Commit messages should be professional and focused on the code changes

### Cache Management with Trailers

When making preprocessor changes that would affect cache generation:

1. **Initial commit with changes** - Add the `Preprocessor-No-Write-Cache: true` trailer to prevent cache file updates
   ```bash
   git commit -m "preprocessor: your change description

   Preprocessor-No-Write-Cache: true"
   ```

2. **Follow-up cache update commit** - After the preprocessor changes, run `./_scripts/runPreprocessor.bash execute` to update `gen_cache.cue` files and commit without the trailer
   ```bash
   ./_scripts/runPreprocessor.bash execute
   git add content/docs/*/gen_cache.cue
   git commit -m "content: regenerate cache"
   ```

This two-commit pattern prevents noise in the initial change commit while ensuring cache files stay synchronized. The trailer tells the preprocessor not to update cache files during testing/validation of the changes.