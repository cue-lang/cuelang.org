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
									hash:       "22QHPVUH70T6IIUUBTCQR5S5KEIM2SMB6GQ3K0N0PFHA2OINCCVG===="
									scriptHash: "LHNJL29ND9SA1PH5FBU1J322PE8QP43C7E0IU7FO3727LLCJ811G===="
									steps: [{
										doc:      ""
										cmd:      "cue help mod fix"
										exitCode: 0
										output: """
												WARNING: THIS COMMAND IS EXPERIMENTAL.

												Fix provides a way to migrate from a legacy module.cue file
												to the new standard syntax. It

												- adds a language.version field
												- moves unrecognized fields into the custom.legacy field
												- adds a major version to the module path

												If there is no module path, it chooses an arbitrary path (test.example@v0).

												If the module.cue file is already compatible with the new syntax,
												it is just formatted without making any other changes.

												Note: you must enable the modules experiment with:
												\texport CUE_EXPERIMENT=modules
												for this command to work.

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
