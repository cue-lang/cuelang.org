package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-mod-init": {
						page: {
							cache: {
								multi_step: {
									"7E8A8UR77MMSBDH6L9MM9CT783U2S8JSOVVEFMQ9A9EHHHTUMH0G====": [{
										cmd:      "cue help mod init"
										exitCode: 0
										output: """
												Init initializes a cue.mod directory in the current directory, in effect
												creating a new module rooted at the current directory. The cue.mod
												directory must not already exist. A legacy cue.mod file in the current
												directory is moved to the new subdirectory.

												A module name is optional, but if it is not given, a package
												within the module cannot import another package defined
												in the module.

												Usage:
												  cue mod init [module] [flags]

												Flags:
												  -f, --force   force moving old-style cue.mod file

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
