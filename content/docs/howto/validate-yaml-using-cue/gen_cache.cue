package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "jeHerIKwGO0wSws1uLTf/D1SpDyhrf/411JoAWyE6nU="
								"initial x.cue":  "GTEYaACJ34/aMs0V7Tx8Rg/duGyhFFX4VRIKrI785N8="
								"another person": "9dOE7vyg05mhFo/1OzvPD44tWRq6yH9VMckUTstED2I="
								"fixed yaml":     "+aP/ONQg1MCVMA8DEYEf9WScoKt25KgPwKbyw+U/YfQ="
							}
							multi_step: {
								hash:       "Q4MBV12J90K2C8LL0OCUBV6E8AC04IR04U57321NDATNGK9VH2PG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
