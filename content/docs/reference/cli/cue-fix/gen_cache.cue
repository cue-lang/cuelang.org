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
									hash:       "I17TME9J4USTQUR4IU0N4EU764CLTJCL26B6RLOJD955RID3UJO0===="
									scriptHash: "U2MBGQ4F3P2124TVTJI2PKD09QCG72BE662SOP225SHAR0OPV510===="
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
