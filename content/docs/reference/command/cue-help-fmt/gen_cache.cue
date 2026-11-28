package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-fmt": {
						page: {
							cache: {
								multi_step: {
									hash:       "I7LN3DRP95KBKL0HFCRKD3HTAMS8D9VAL1UOKDAJMF5N916OHVA0===="
									scriptHash: "G5RGV5TON2NFR2K66GOBSOTBIC51GJ8QTEFQ4HRD9Q56M443IVRG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261127222705-d53722b2b9cd:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help fmt"
										exitCode: 0
										output: """
												fmt rewrites CUE files in the standard format.

												Arguments are interpreted as import paths (see 'cue help inputs') and all CUE files
												in them are formatted, including those behind build attributes or without package names.

												Use --files to treat arguments as paths to files or directories to recursively format.
												--files cannot be combined with --language-version.
												Directories named "cue.mod" and those beginning with "." and "_" are skipped unless
												given as explicit arguments.

												Examples:

												  # Format stdin
												  cue fmt -

												  # Fail with a diff if a subset of packages needs formatting
												  cue fmt --diff ./foo/...

												  # Fail with a list of files if any CUE file in a whole repository needs formatting
												  cue fmt --check --files .

												Usage:
												  cue fmt [flags] [inputs]

												Flags:
												      --check[=true|false]        exits with non-zero status if any files are not formatted
												  -d, --diff[=true|false]         display diffs instead of rewriting files
												      --files[=true|false]        treat arguments as paths to files or directories to recursively format
												      --language-version string   fallback language version for input outside a module (for example, v0.17.0)
												  -s, --simplify[=true|false]     simplify output

												Global Flags:
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

												"""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
