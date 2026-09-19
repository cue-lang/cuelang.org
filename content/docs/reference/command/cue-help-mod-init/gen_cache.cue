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
									hash:       "ULMF8C8OJULUV33JCVF3KQAC6CKHBS9PQ2VAVBKCNKGMIIV6KRM0===="
									scriptHash: "LLQ3AUON50476GJLKO0AKSH9145JJUKMDH1LVOM68ATU3ODLIUU0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20260918143709-50e1f64b6460:$PATH"
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
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors
												  -s, --simplify       simplify output

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
