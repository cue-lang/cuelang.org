package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-fix": {
						page: {
							cache: {
								multi_step: {
									hash:       "G92A0588PVNHILU3A5U2DST9C7J7HODF0JH4NVRJQ28A4JR0L2O0===="
									scriptHash: "RKEQ0LIMRQT40I41QNVFQJB7P421TJBIV8IRPTVSUTIDGI29JFI0===="
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
