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
									hash:       "LIJK4IK3FP4C8524P2F04G95OOHTP14QI86QO7SHJL7UAG0NS5AG===="
									scriptHash: "QT2U4I6TPL486GT6A1UH2ISFG2F05L3ERR3QFMAU15C70D8SRGR0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.2:$PATH"
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
