# cuelang.org

## Common CUE Project Guidance

At the start of every conversation, call the `mcp__cueckoo__guidance`
MCP tool to retrieve the latest shared conventions for CUE project
repos (commit messages, code review, community support, etc.). Follow
that guidance in addition to the repo-specific instructions below.

## Testing the CUE Preprocessor

All tests for the preprocessor live in
`internal/cmd/preprocessor/cmd/testdata/` and follow the
[testscript](https://pkg.go.dev/github.com/rogpeppe/go-internal/testscript) format.

### Test file naming convention

- `execute_<scenario>.txtar` - for successful execution tests
- `execute_err_<scenario>.txtar` - for tests that expect errors

### Running tests

    # Run all preprocessor tests
    go test github.com/cue-lang/cuelang.org/internal/cmd/preprocessor/cmd

    # Run a specific test
    go test -run TestScript/<test_name> github.com/cue-lang/cuelang.org/internal/cmd/preprocessor/cmd

    # Run with verbose output
    go test -run TestScript/<test_name> -v github.com/cue-lang/cuelang.org/internal/cmd/preprocessor/cmd

    # Update golden output files when preprocessor behavior changes
    CUE_UPDATE=1 go test github.com/cue-lang/cuelang.org/internal/cmd/preprocessor/cmd

After updating golden files, always ensure `go test ./...` passes for
each commit.

### Key testing patterns

- Use `!` prefix before commands that should fail
- Use `stderr '<pattern>'` to match expected error messages (regex)
- Use `unquote` to process files with `>` prefixes (allows embedding
  Hugo frontmatter and template syntax in test files)
- Files are defined at the bottom using `-- filename --` syntax
- Prefer parse-time validation (in `parse.go`) over execution-time
  validation for fast failure

### Cache management with trailers

When making preprocessor changes that would affect cache generation:

1. Initial commit with changes — add the
   `Preprocessor-No-Write-Cache: true` trailer to prevent cache file
   updates. The trailer goes after Signed-off-by and Change-Id lines.

2. Follow-up cache update commit — run
   `./_scripts/runPreprocessor.bash execute` to update gen_cache.cue
   files and commit separately:

       ./_scripts/runPreprocessor.bash execute
       git add content/docs/*/gen_cache.cue
       git commit -m "content: regenerate cache"
