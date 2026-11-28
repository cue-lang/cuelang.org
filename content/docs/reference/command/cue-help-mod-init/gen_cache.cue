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
									hash:       "02DLTTHJ6RRVLJVDLH8AH3KOPJ8LJVM21G1QS3R71HB07HJ1HJCG===="
									scriptHash: "I1S3OLR2GN6FU22UNE0O9FJ02PN52UKMRE3T6V92SD5BE7UHK95G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261127222705-d53722b2b9cd:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod init"
										exitCode: 0
										output: """
												Init initializes a cue.mod directory in the current directory, in effect
												creating a new module rooted at the current directory. The cue.mod
												directory must not already exist.

												If the module name is not provided, a default module path (cue.example) will be
												used.

												The --source flag sets the module's source, which is required to publish it;
												see 'cue help mod edit' for details.

												Usage:
												  cue mod init [module] [flags]

												Flags:
												  -f, --force[=true|false]        force moving old-style cue.mod file
												      --language-version string   set the language version ('current' means current language version) (default "current")
												      --source string             set the source field ("self" or "git")

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
