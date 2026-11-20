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
									hash:       "FCCFRIVKET1PFO5ENJO0GHFPCAODEGH7GLSAHI3VGCT4CAAQ361G===="
									scriptHash: "E7DUJE7UDIUKCFSNHE67UFQ6CHPHSA7U2DKOSEE2BKS71II6M4BG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261119142547-4feb85fac20e:$PATH"
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
