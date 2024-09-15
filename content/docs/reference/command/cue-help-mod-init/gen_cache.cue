package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-init": {
						page: {
							cache: {
								multi_step: {
									hash:       "GG8OS5J402I4QBE871KDG7CODL5LFOCGF9VEEHO8H6BNHU3NK9A0===="
									scriptHash: "L02S760GCS8RKKBH88NQFEG1JQ0DMQOEN7HDVIKMUII2HP512H00===="
									steps: [{
										doc:      ""
										cmd:      "cue help mod init"
										exitCode: 0
										output: """
												Init initializes a cue.mod directory in the current directory, in effect
												creating a new module rooted at the current directory. The cue.mod
												directory must not already exist. A legacy cue.mod file in the current
												directory is moved to the new subdirectory.

												If the module name is not provided, a default module path (cue.example) will be
												used.

												Usage:
												  cue mod init [module] [flags]

												Flags:
												  -f, --force                     force moving old-style cue.mod file
												      --language-version string   set the language version ('current' means current language version) (default "current")
												      --source string             set the source field

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
