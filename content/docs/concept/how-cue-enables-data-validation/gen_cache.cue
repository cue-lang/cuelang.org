package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "080pujBFL0nkQ6XZUaMXhSjn0U+l0c603rg+fG9kzSs="
								"data: bryn (broken)":           "lM840r+UVYi5VxDmFOlnxWztqU8LHwcAbeZpCFeXvs0="
								"data: charlie":                 "zELo6yWBaQ6ZhdfT8ygsKDl1/yTxVByxZ6hes4svGSM="
								"schema: CUE":                   "XKD6JIT6V61dKfKn0Ev1O9t16zrCgVGXRlzTtQCbPJo="
								"data: bryn (fixed)":            "yIHMQw9bgB/3SelJFNm+MpBeTJXywbdRceZZPlBL9m8="
								"data: alex (reminder)":         "iym4MAKLJkp2bSNl6YucVmKqfZnjRLXuNiAtErPZQoU="
								"data: bryn (reminder)":         "FuMRg3/dAByikSznqauJjz/mCqdj8onHM1Eqmx1Aauk="
								"data: charlie (reminder)":      "TpQ9XSxqT3x6mYSL8uEKzPSBnTlyM9smw+gUukhAbco="
								"schema: CUE (reminder)":        "xc4MnrWy/xs+UNFhhrZoKHZK9zFQ1qgrclfbWxsd5h0="
								"policy: CUE (too restrictive)": "bU5iRrRT/IJeKy/OOB9Ks0pmJ+M36mjqpMeb9erS8Sg="
								"policy: CUE (correct)":         "mnFDjyuUnnLdiDSKuUT21jGAd36cuW6V7o3Rx1pAcis="
								"schema.proto":                  "FU9e2y19ZcZ3yuV78Ue01/EcjVkMQXvk1It50v0O7dY="
								"schema.json":                   "AUZOPTlDOIn7otuC2haDT0xKhQkcE1zYM7MTRfHigXM="
								"policy.cue":                    "02dFLkPUnhMKm2PpAxJF2NblNpf5pcPveBMPONL3ofQ="
								"data.yml (broken)":             "A47uJa3kt2EdPgMBYeZzjn44SHEmQohSYCIbNzj26y0="
								"data.yml (fixed)":              "RnGEUGh0OhW9GIvaM8IZXPZ16OooYnvWFEzvL80yCu0="
							}
							code: {
								constraints: "962H/4aqdTo3hnu7yPfrGXpFWWOOL6Q2r7wwvrwFjtw="
								definition:  "cPi7A3n7HhcUAuEdXjLcUwCK0dfsLPUOXk5aeMj3h2A="
							}
							multi_step: {
								hash:       "MLB9NKO1LEUNTFPLVQ1FM1LQL3OJG6A69BBLQKNQD36FVE8SLB6G===="
								scriptHash: "5IRU0HUMAKN4O1TE41F2439MMECK8AS890TU89R3REV16HVJRUN0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											type: 2 errors in empty disjunction:
											type: conflicting values "cat" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:18
											type: conflicting values "dog" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:10
											height: invalid value 2 (out of bound >10):
											    ./policy.cue:4:10
											    ./bryn.json:4:15

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
									exitCode: 1
									output: """
											aBool: conflicting values "this is not a boolean value" and bool (mismatched types string and bool):
											    ./data.yml:4:8
											    ./schema.proto:5:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./policy.cue:9:10
											    ./schema.json:14:21
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:21
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3

											"""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
