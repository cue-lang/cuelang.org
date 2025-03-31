package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "pp6Ikz+LfChA6q3QNrkJejarpj1RC7TnDO5+9Fve2YM="
								"initial x.cue":  "4bueqK58SZBk8ZigZ8VEf0wXm8F6Spolr9pujyUa8IA="
								"another person": "1lm1nTnP2YjoX3JN8b/niY5xGlYywlRogWRXLxF/IP4="
								"fixed yaml":     "3/IBf3i9R3SllRFtBbiwn2X6e1pTbG3QFsUwQZn/D0E="
							}
							multi_step: {
								hash:       "D0BMII88A64KTNORIL20FVE2D5MGCC4QU1P1ITO7M508FIBRN5CG===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
