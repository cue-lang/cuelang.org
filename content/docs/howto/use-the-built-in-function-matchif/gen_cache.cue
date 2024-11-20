package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "CHP0QkBLuhfrMnHGK1PjF2Ja9tim1GbZ04eMylKLglE="
								"future: helper fields": "GNAgH7ycPZ+nfZiBNpqLMuz+lyTL6tDRmoN6tc/zQr4="
							}
							multi_step: {
								hash:       "IQS0FTD4DND7I1RO9QCG4D0VSCGC8JGC8QVLCEA1HB6QDSPB006G===="
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
