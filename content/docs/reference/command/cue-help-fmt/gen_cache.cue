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
									hash:       "508F1T60OG3VO9JDO9FI9POOIL1IHT39R3SSQ9E8DLE8GBSOKANG===="
									scriptHash: "CGB80GJOMFUN7CF66INACAF60BR6RB1UT9P9E3SNL9JRE8MHGGJG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.1:$PATH"
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
												  cue fmt [flags]

												Flags:
												      --check   exits with non-zero status if any files are not formatted
												  -d, --diff    display diffs instead of rewriting files
												      --files   treat arguments as paths to files or directories to recursively format

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output

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
