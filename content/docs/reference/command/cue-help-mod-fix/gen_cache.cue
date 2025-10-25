package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-fix": {
						page: {
							cache: {
								multi_step: {
									hash:       "SUVJEICBL92HAAC3UOEFSA3HE7C3MKPJS6B4HG2J7L1VQE3K79IG===="
									scriptHash: "IH1U9P0KR6R94GCVILBFTBPHHGCBR8SGU7DTCA0CU0OFCKJSE46G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-alpha.3.0.20251025133102-654b5c06c385:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod fix"
										exitCode: 0
										output: """
												Fix provides a way to migrate from a legacy module.cue file
												to the new standard syntax. It

												- adds a language.version field
												- moves unrecognized fields into the custom.legacy field
												- adds a major version to the module path

												If there is no module path, it chooses an arbitrary path (test.example@v0).

												If the module.cue file is already compatible with the new syntax,
												it is just formatted without making any other changes.

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod fix [flags]

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
