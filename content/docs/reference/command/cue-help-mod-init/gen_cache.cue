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
									hash:       "PMNPNK4RNJHF3NJ49R9V8L1FGV8BGPSQ5MVJPOM4K544T984AUE0===="
									scriptHash: "H3HANI129IQB8HAE2PAV63769M7IOSSS9VP6B2E6FNT7PGF0EQ30===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.4:$PATH"
										exitCode: 0
										output:   ""
									}, {
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
