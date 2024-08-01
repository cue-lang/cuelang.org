package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "MNCVD8Gtj/4lFiyF8XioVuNubbvgU6frN2oOMp/EYXI="
								"data: bryn (broken)":           "VofbqiSu297obQPqfrxRc57AD4D8Bz/CiUgdf1937QU="
								"data: charlie":                 "/yj1r6392sDZ5adoL7QLCGRIf7WyhMr2TxD7kloMU8U="
								"schema: CUE":                   "ZgHyku6OxI9IQ+iDpe/noZxD6mXvmyJtXSV+FIeG/Bc="
								"data: bryn (fixed)":            "eRTUNMnsmw/mrhSOqyStixXTFqMM8/Ip12TD8u1StUs="
								"data: alex (reminder)":         "XjY/aZ8uP/nAmX/0AfYMkwtFelmGGriARiKJoC+8eYY="
								"data: bryn (reminder)":         "ZFOd/bxqskyeW2jwuSpfIs6CzuyapPd0VM+JXNAuc5Q="
								"data: charlie (reminder)":      "5wCV1HebejDuyG3bISbtIjZU9KSiNMar1xlFU3d9TY0="
								"schema: CUE (reminder)":        "pmrq3qUCVEuvcPNidTYXTaNU4c/kjH2JYQuyczTIIMU="
								"policy: CUE (too restrictive)": "lh90gBGkkxCSaF7VFHgeErl6a2BdAX/sMmfswxt6eFs="
								"policy: CUE (correct)":         "61MRVJRTClDIBtrvjomcVSE0erjpwOzJsle94ejS3EQ="
								"schema.proto":                  "aPYHLmIh2ZdbEfJjFV7V1gZD2qoCpGGY/09IKTp5v2w="
								"schema.json":                   "ZdpUINNfBjWzLbWcE0kbD7YOPnMEekRX0GBy3Sq+zMM="
								"policy.cue":                    "52rtbV14gNVqg8p9SncX8QBRvU1YBDQGXTuQcTELpS8="
								"data.yml (broken)":             "WKNedoNS9FEKA22+9GJ/ONKrWcphcmhfKnS19/sQ+tQ="
								"data.yml (fixed)":              "twzlAaefE6LKQrYQnEqhduWsqjqvb8dQQFgwjfc5IuM="
							}
							code: {
								constraints: "mNVoNlal/BBnQRfNgPWMjDPKHXlxdnaqgv/UmYZ1v3o="
								definition:  "Cvr5oj/XQBZHxtymN+TP2zhyQHyWl3+fggdw3/awA3c="
							}
							multi_step: {
								hash:       "SOPR8N74A1NU0KELB1LE42T46GSFBOITV69RVV49AM213NIG4E50===="
								scriptHash: "3UTP5PNA8DAN79NI2608LE566NUGOT51A65SSH4PNGVB9HCPNDB0===="
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
