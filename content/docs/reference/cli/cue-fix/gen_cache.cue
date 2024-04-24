package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-fix": {
						page: {
							cache: {
								multi_step: {
									hash:       "JVNU88OB9CJVN79PN08LG3UF1G94TQQPO6RO5FPESR7VLTKGNOE0===="
									scriptHash: "PUFA2FSK4S989R83I8606SIF1CMQ0Q4SD1DT7MHMTA67MU8SBGQG===="
									steps: [{
										doc:      ""
										cmd:      "cue help fix"
										exitCode: 0
										output: """
												Fix finds CUE programs that use old syntax and old APIs and rewrites them to use newer ones.
												After you update to a new CUE release, fix helps make the necessary changes
												to your program.

												Without any packages, fix applies to all files within a module.

												Usage:
												  cue fix [packages] [flags]

												Flags:
												  -f, --force   rewrite even when there are errors

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --strict       report errors for lossy mappings
												      --trace        trace computation
												  -v, --verbose      print information about progress

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
