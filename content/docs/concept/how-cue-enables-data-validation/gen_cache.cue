package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "gYH/DlKb06CE1UYvdzzRiUxe/sc5OW+Aq/7Pm6DKYM4="
								"data: bryn (broken)":           "JVeNMlvKZJ/GuSHrFUg3rZvkoeR8YSkpel0eBrKKHVE="
								"data: charlie":                 "fJSFDpPPKfmYu3JdPzz2mgwsEPrgrPoYamD+5UMvfh0="
								"schema: CUE":                   "p+VSdYcZOdWf+ZYDoi49N04qzPUI4qdnaGuSos2190I="
								"data: bryn (fixed)":            "XhLkc/yPgLZn6W866KrY2zUOqF/9lDPBKraUqlbWVy8="
								"data: alex (reminder)":         "xM0XyEWr9GJYCOC3O9mnf1/1Hh4AsSLdGaLo7ROyZH8="
								"data: bryn (reminder)":         "bLrpon20EHfKpbgS637DNHz/nwBU1p9+HjQ4T/d4x70="
								"data: charlie (reminder)":      "1GNGDIq9cci5fpnwA/iDKKGTnhdOl4YDrFlNIXNJ1ig="
								"schema: CUE (reminder)":        "WB4M4EvhuV60jxR5VbstUDOQ4HmjYF71msd3vPFdQnY="
								"policy: CUE (too restrictive)": "Y3oSfJl1vYF+Q7KEzR6ilmSGfe9vi8n72OtXLiOMPDs="
								"policy: CUE (correct)":         "Q/VmitBnqjrfann7r/NKSV71evjXHOFMlQot+wU5TEs="
								"schema.proto":                  "vERILg7iKk8tthg3ykmDNNdIaOUt9cbUdew99B/yE2g="
								"schema.json":                   "+F5rHIUIWZC1uAYAic+ORBscwunb1WNs061cqlnCTkQ="
								"policy.cue":                    "L72G5e5z2HzTGGPLN+gylgPjimxD+f3W5WTcnnbLLGo="
								"data.yml (broken)":             "ykOQTaNeNStOyAdI5GCuV8Nsl8M9E3PlC9BT0GoIkcc="
								"data.yml (fixed)":              "4a4phFMmbbz23bHDh5746UjceaaJu0kofiieR8//9Lk="
							}
							code: {
								constraints: "INZrvNhE+c5tRiEMs/K4yQiWnIPCfMVP6M4NwFDbHBo="
								definition:  "1scjy8wNhtd3mPKsAlLLciZJAt9d/fmUyxN3gBrCRjM="
							}
							multi_step: {
								hash:       "BI7P0QPA8NSR4QSF1UDGJ1FNMUKKFT7PPULTNBIK9TKHU8VKF930===="
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
