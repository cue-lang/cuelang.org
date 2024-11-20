package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "KxI1e1cldaGBV8s9SiyPqRygtHtXGRSSw4JSd1XxETw="
								"future: helper fields": "gJL/uLj50KAAUsxe/I9lXz9RwJp+8aGVX+fKTFrXCzE="
							}
							multi_step: {
								hash:       "E8FNAV149I9SOE4DRVNQ56BKFOLO0OEI7ESEF8O8BC1ODFQ0A4VG===="
								scriptHash: "DFQ7AR8CM6AD7KN6T2GG9RC389GLMATEH3D0IR21BEIBFDQ95BSG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.11.0:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0
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
