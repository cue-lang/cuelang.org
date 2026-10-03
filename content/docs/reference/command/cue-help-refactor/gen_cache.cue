package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-refactor": {
						page: {
							cache: {
								multi_step: {
									hash:       "KTQ3HSKCHFBQOND4TV057CP9E0U8H2VPKQKB4VO85CK6VQLSD4KG===="
									scriptHash: "6VR215NSEGU6JOPCIDTEE1BLGQVUPQI05KP4GBAEU2QLLG3ELDR0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20261002131943-93402de82790:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help refactor"
										exitCode: 0
										output: """
												This command groups together commands relating
												to altering code within the current CUE module.

												Usage:
												  cue refactor <cmd> [arguments] [flags]

												Global Flags:
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors

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
