package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchif": {
					page: {
						cache: {
							upload: {
								example:                 "HibWjM6XlR4P+ltBMd54oC/Ze1YNzkLnV7QUOzzKERA="
								"future: helper fields": "OQXTrCkYa+OdOsposvBR9uKgl5AM3D0I0AVFcU8wXXs="
							}
							multi_step: {
								hash:       "BQIR2VI2GUTSE56UL98UG2DCL2GA2EI82TCVCF4UVMOTS01OO540===="
								scriptHash: "UMBCEUDUCKLPSNMILFDUULPBJBNEE8UENK8FIRV9EP1SFJU6242G===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.12.0-alpha.1:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-alpha.1
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
