package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "pGZJiVu9sbMbrQhraHBpdgePSAmVwseogkI//u0XLMI="
								"data: bryn (broken)":           "BwryR+lcukHQAEH2/bawhodYFkSMl4nuLakYdBvLEk4="
								"data: charlie":                 "aP+ZoVo5SRktxIUD7WDk/sCig0Xv5GnAFC5+kO07XCw="
								"schema: CUE":                   "VJIdR6Fx9fb08U+OkVt6ef/MK+CwD1hXgg7ruUXeFN8="
								"data: bryn (fixed)":            "tW1Uz8KsdnY5VLHp4oDpwzXs0v7c+rO+sMr5ZUpTm64="
								"data: alex (reminder)":         "vynq9ikPRm4RB3JiL8Xh5q+s0xJO8lFTYGdQhASazz8="
								"data: bryn (reminder)":         "Up7KHP3taF1cmCcy2zuMen985yPSlDlm9ExjU9TIsaQ="
								"data: charlie (reminder)":      "EjGubp/BPtyg3Dilaj0D1EuL4WxNcYjjcbD0GH6vUEU="
								"schema: CUE (reminder)":        "sdJ/KUQ/Gz8UQvUcpwItizJrm8LX1rYeKhTFS8Cm1c0="
								"policy: CUE (too restrictive)": "zmSTuhhiypQBc/249HFdM5tnHHzl9jZOffZ1xi6+HJk="
								"policy: CUE (correct)":         "R+P6+56LBkF8+MdpVsXTcA9TfTEknQ3X4Q9lISgmsgw="
								"schema.proto":                  "KqpZ5J3Kc2PVDhKz4Yjv22npJq72zcGmYQjlzd0toRo="
								"schema.json":                   "y41T4Afvqzv7wOx8s9CoyJ4fcUPCMeP/09G/D6LYV7g="
								"policy.cue":                    "/o47M7WRmvTRYU315E+RwWxXLTDax1eGl9uMLAvk8Fk="
								"data.yml (broken)":             "fDQ430vhnJQIwGRpUtz2sFubNPO1dnf4DoHSTufsYhk="
								"data.yml (fixed)":              "gB2cR0Gg18sZho05vpJo5EdhZq2DknVFRNuHSnj8V0o="
							}
							code: {
								constraints: "m9H0zkwBKRLq2aQH7b0fdV3mr+PGHqWxOZR+bygFb+A="
								definition:  "QSyXALMf3l6I1c5TMCVOGQHoA+Hkw3SkIUutWk1OuNA="
							}
							multi_step: {
								hash:       "UEC3LU31E5RUCN2THPL6H2M3VTS1FPBEGL79DB1QQ7JB82KA8CUG===="
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
