package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "rM+2DaL/brS0jKKJSr7KSB/tWKlMab/fZSyHaMj2wBw="
								"data: bryn (broken)":           "A3viH+tCcsDWpfTlFmz9JohpjmSmQxy8RzoI5w+zMTo="
								"data: charlie":                 "AImnhgOuO3v6vc09wbPqtgJp0x85VUx2cazCqyD9Avg="
								"schema: CUE":                   "OKGmOT4L4zrrv50G2vfWJcaR1HDIe0DpKr9D96mw6y0="
								"data: bryn (fixed)":            "zJ0UfGzxMcZO6xO6l5F8PC1g7EDMAUn+L32xsqFP0CY="
								"data: alex (reminder)":         "sH9Somj9oC53hPDgAe/mfu5Jti/xmlo4MbDg2pIP7zk="
								"data: bryn (reminder)":         "jiBTGj5AnBq5G8oD9rSyvd1eTjw2o1FoWzbKoLdmM4M="
								"data: charlie (reminder)":      "v+Jysd53a2c6Smf4691iB2h5eFgt+T7Jl7AyPRYyNsM="
								"schema: CUE (reminder)":        "qqCmjzA4MeQN1Xendq7oytSbdyqsslY1AZSeVAddZXw="
								"policy: CUE (too restrictive)": "TArILjHKiPY2xxAYpOeC/QlKF40XiQjTEEpRB2UkVgk="
								"policy: CUE (correct)":         "x7pr8QwcNOjSkVnaMlpzGal55GunxhVLzRLPksNHCwQ="
								"schema.proto":                  "b71R0AGzDgHny9IxmiuqMM+Ws0eOPP+Z4MViNwrNak0="
								"schema.json":                   "T/USU4OpHVZkLPsyE1/G8wkERynMJ5DnxbmMHqckIJ4="
								"policy.cue":                    "dNStSA5vh/zEoNHYlAqr8+7ZrR9DMcK5MfabPVYcQHs="
								"data.yml (broken)":             "bOHpTzhwdMljHWe/U/Q11hew226du830JMbTydhVZHI="
								"data.yml (fixed)":              "Kt/sd2Jqs0EciN3jxMB/1ZVM5Z10mU1Hwz8yS4vwhLg="
							}
							code: {
								constraints: "KOOAcNoy5uiUAC59EFi+7D/qGCkxvydbHkX3h/VkY3w="
								definition:  "RQjzACrWIElVEDwn4fYJzTbPDE8QS2CZZ+tFBvBxLKo="
							}
							multi_step: {
								hash:       "P78KAG3TAC3DN071K33OKRP1QC3IL4FOVVPS04MJOR07VV6LNH10===="
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
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:21
											    ./schema.proto:2:3
											anInt: invalid value 5 (out of bound >99.0):
											    ./policy.cue:9:10
											    ./data.yml:2:8
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
