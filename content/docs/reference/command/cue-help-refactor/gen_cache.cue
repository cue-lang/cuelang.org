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
									hash:       "85L5AOSUBFDE85VFSUEM46SQDNE7GD9E3H4G1APFKA3TLIM5A580===="
									scriptHash: "8VNB9S21LRV8R0091S8GDQ81DGI3DBKVP719IKV71B91R218BMR0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.0.0-goreleaser.202609101448:$PATH"
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
												  -s, --simplify       simplify output

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
