package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-mod-fix": {
						page: {
							cache: {
								multi_step: {
									hash:       "U36KD4C3MJ903236H2RHQ4D6UCONHT4H4RLVDOA4GP6JRK2LTLPG===="
									scriptHash: "LHNJL29ND9SA1PH5FBU1J322PE8QP43C7E0IU7FO3727LLCJ811G===="
									steps: [{
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
