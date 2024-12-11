package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "cMRsWc/kwsqpd3Q2kwsUZH5uTfowNOuaaG/4dFmbmis="
								"future: helper fields": "Vfmksw8xdLC5j5TjqxRXYy+sr3Oz2I9mue7P9hqTaek="
							}
							multi_step: {
								hash:       "OFS4PTRKNA7E31M1IUI64M6585470VLDKK860EDV4G7AAQ6K1390===="
								scriptHash: "TA7LIFBMHN2EJFL99H2B6V81A7QQMFPRS6Q03K3HFPM995MS0N60===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.12.0-0.dev.0.20241211161443-0005c227d164:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-0.dev.0.20241211161443-0005c227d164
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue vet"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchIf): invalid value 42 (out of bound >100):
											    ./example.cue:9:4
											    ./example.cue:5:4
											    ./example.cue:9:12
											    ./example.cue:9:17
											    ./example.cue:9:23
											D: invalid value {x:"some string",o:99} (does not satisfy matchIf): invalid value 99 (out of bound >100):
											    ./example.cue:17:4
											    ./example.cue:13:4
											    ./example.cue:13:26
											    ./example.cue:20:17

											"""
								}, {
									doc:      "# This command currently succeeds:"
									cmd:      "cue vet .:helperFields"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
