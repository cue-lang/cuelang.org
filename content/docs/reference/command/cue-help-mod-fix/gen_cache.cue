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
									hash:       "N595O60NLLQTCDOIV37MISEV5L5A00Q2FO7GJH15CRMEP2BO8GD0===="
									scriptHash: "7C7RJEGI9O3HT5FE5D8MKN8A1BV8IT24KFCK2GM4B0B1HPCGDO8G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-alpha.2.0.20260220153551-3dfa50a46189:$PATH"
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

												Usage:
												  cue mod fix [flags]

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output

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
