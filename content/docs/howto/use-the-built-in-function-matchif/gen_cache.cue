package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "C/pwB4YdwE/2FDLzztPUwoQdAgNSmqpR8rhSmhjc8tY="
								"future: helper fields": "XWTmWFF8e3bRnKE8uM0Zxj0Mw8UThSOPQj+fWkyA71Q="
							}
							multi_step: {
								hash:       "GK3517NBFV5CBQ6LV17OASAPNNSLN9CVS7B87C0C952809U54CBG===="
								scriptHash: "VNA9UV3Q2QN3MTIPLKPLKSNIDBI8K6I9DCNHQUSQIG2MHMV7D3EG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.12.0-alpha.1.0.20241220130530-e4c4b8e8a15f:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-alpha.1.0.20241220130530-e4c4b8e8a15f
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
