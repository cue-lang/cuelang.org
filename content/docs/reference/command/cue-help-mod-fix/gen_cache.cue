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
									hash:       "KGRAKO45U2LL16AA0BPN6C3SJR90VUNV78NLQO84DOBRQ827H0GG===="
									scriptHash: "6D5AS48IBKB0M2HKNEFB6VC21NFDL2DQ35RCI92EV8650NQTFVDG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.1:$PATH"
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
