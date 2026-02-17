package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "HkMzwrF4HBBANsxRBhRDT8iS+OV21BklX31uFQuxH5Q="
								"initial x.cue":  "A0SIL+4iv12N+On9jq0Ug2UshEr9s8iX9lKywPTTi10="
								"another person": "HWr3864en/cqecH6Mhw40mjKYwGklBL5VHglJfIHDZg="
								"fixed yaml":     "i1zprB1vRTJRKbrJ3osoJKPmXxE2+5BEYjMMyhvnWQY="
							}
							multi_step: {
								hash:       "7D53O4M715VJ2HTKUKFOC45NPPLIOOU4BLQ0VB1LNJR4U1UB3BAG===="
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
