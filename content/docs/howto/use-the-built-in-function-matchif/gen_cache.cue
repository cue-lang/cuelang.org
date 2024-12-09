package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "B1xd8jXoa2U9KPZKpbnXh0W1Lqw4XR+Emw5KiPj4upc="
								"future: helper fields": "uLeL/l1+yFIMOkBCYfFRTwI6cf09ogYf/ydTwGYaBbA="
							}
							multi_step: {
								hash:       "BIOO0HNROTR0455H81EGB2FAE1J7IHI6KUPVR0S6LUI18RP51DU0===="
								scriptHash: "2J8B8RM9F846V30OBD3M5HMNA59OCE0A1GVU0C43H709A524MKO0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.12.0-0.dev.0.20241209170035-d298a53db8bc:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-0.dev.0.20241209170035-d298a53db8bc
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
