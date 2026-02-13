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
									hash:       "79UFUFNP3KBCBESSRRDTFDE8N85J4R8HGH9VKQ5IJ62J8HA638I0===="
									scriptHash: "3TJJLHPCAFTKVS375TNL2BEL5RT3TMJICS29E4HF0ED75M4807M0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-alpha.1.0.20260213130521-9e2dec3b9a23:$PATH"
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
