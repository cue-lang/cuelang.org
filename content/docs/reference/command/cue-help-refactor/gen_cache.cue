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
									hash:       "C6T0TSAN8DCMCDG2MG1BLFT1B6F4K8709LJJM5GI1M62HBLEOA5G===="
									scriptHash: "VDM7EC02BR15TQB501J9QEM13H8KSN6GHEKLDH0UV5DNFEMTO8T0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.1.0.20261023142911-c9393fa32ac5:$PATH"
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
