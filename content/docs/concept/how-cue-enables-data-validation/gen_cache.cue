package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "kPuTXMNtdf20rTHTfwpHZJ8uqFBi2/RDTIsYV4fTOMY="
								"data: bryn (broken)":           "eMm8TmYh8y82PAkB3F3jmySkFkvZlsO1Eh7c3qCFlyI="
								"data: charlie":                 "CT6uysVmBBY0xkVoCY62Nu4FykY9zx9r1508p8/eC7s="
								"schema: CUE":                   "GhUpI3HaePTUqXRMmZhW5xgAmji4aV2+ujT6LM7GCec="
								"data: bryn (fixed)":            "ER8ZV2fVRP71VkbABSPVmbHCRfdAwHR7wt+rI20eEGU="
								"data: alex (reminder)":         "0PPBAJXIqP3CbhcXYAhNKItCss998QyGLpfcWkzU8Tk="
								"data: bryn (reminder)":         "Qt9bNcDi6u0ixzevXHXb8OzfrMbNnL47szoPQFj9owg="
								"data: charlie (reminder)":      "53UAVBK8K+Gk8ZNAayMXOeiF4mCTw8fjNCeo7DgmF1c="
								"schema: CUE (reminder)":        "hwgczmZMzCbM/Q9eNtucHDEkDoYzMI3Ybf3ISnvN1p4="
								"policy: CUE (too restrictive)": "rrYBrLH3b069KHl46MhGV1zU6iaDMjN56Nm1bAqhIQU="
								"policy: CUE (correct)":         "DgugjqIXTG8quNVDrYAI/tgq2x3gykc5gOF63SQLN6I="
								"schema.proto":                  "O1bzl+mVVEZtsKa9GflZVSHr2CyHzu8qj5yPj48Ax0g="
								"schema.json":                   "vb4sWEFBRcVaKdcyN1v57Kn53A2KYTqgAaFSX6TTysc="
								"policy.cue":                    "v28iy/VwIc2k6tyTrilLejS0tygSciQmSKDO4hlMmBg="
								"data.yml (broken)":             "hmL+B/ytqQ2XwihAHhKrxv5EkbM0elV83x0iLYYP7dY="
								"data.yml (fixed)":              "HjcXL1lsi0LmpBBwIfHgsM9F721qGCNaYlHxrNFsf6Q="
							}
							code: {
								constraints: "ygDkcMLGpIwMzzdPtNy7GvH4AlHzIe5p0hMLEkCCKGY="
								definition:  "Po7y4bR8nmfuJIt5/URr20C2hjXZZk4UWGynVlGcfbE="
							}
							multi_step: {
								hash:       "I1B468PPR5LL1MR95L3590T44PKK52EKG953A3H72Q6LT3LSDI5G===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
									exitCode: 1
									output: """
											aBool: conflicting values "this is not a boolean value" and bool (mismatched types string and bool):
											    ./data.yml:4:8
											    ./schema.proto:5:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
											    ./policy.cue:9:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
