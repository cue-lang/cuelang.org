package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "e1asItbt6Ldw/kf2WJ1D/NfeL9RfBCTKfCK1S5Lb6vA="
								"future: helper fields": "bHwiMCsFOYQxNUpSMIDGewbScMPnrAW9id7LF3jOQ3Q="
							}
							multi_step: {
								hash:       "OQ9D28A99BDAD5JAHDAE01850SMI6M7U7MHPCQRV2INKC8260BJG===="
								scriptHash: "Q1P8FKC0ODNNCC9P2QD0JTRD6IARTMALU9LCJGL8RA7RJ5GCHT0G===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.11.0-alpha.5:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-alpha.5
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
