package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "XUnX4dv0JDGBfp7/910v0/bvTssVgHs0enneREwFbNw="
								"data: bryn (broken)":           "HSQLlTdsT7AOTnyi22sggF5Xsm3yBFJFFqljwU1/e3M="
								"data: charlie":                 "rtTQBLlJ+ayNdOL2Dyzv+DWuQWnBp+DHtR1KDJtCsTw="
								"schema: CUE":                   "JI9+GiG3fTWsSe+nC9MmIbtuoNegzJfEtjgZZxTSwhU="
								"data: bryn (fixed)":            "IrA4aWb3sFrKrAfttbaG6K0q8j+byDJ69eIABGdSSJI="
								"data: alex (reminder)":         "CFgrMllaidhyY3nqcC/moorudAPnrTcA2eq/3wxduxg="
								"data: bryn (reminder)":         "IWFSjG2A2T5muLgdkUq1QO9eZlLShXxBEiBU5q+RN3I="
								"data: charlie (reminder)":      "Rd0bwje8hqnyqcpqj2aDl6pp/KffjLLBSkANBUvceIU="
								"schema: CUE (reminder)":        "iXL8olBPdGCE98FSzfpCaDKa/FNtPDE1OP1wmzFWYP4="
								"policy: CUE (too restrictive)": "kEuANjILeiBQAaF+TYsHCI1HihXC2WU6lXQ59+HRMLg="
								"policy: CUE (correct)":         "h6wNnt+daEfDF5rZkHnaxIIRHURgG35IsyUUfGEWke4="
								"schema.proto":                  "3A0xTbhhxUFnBbzhOGBIKFX/cHvHvFHxW1/T2JsZcns="
								"schema.json":                   "JzX95wj0IG0FjxTCGZuBugTPIdCWXEePEQtif8dm17k="
								"policy.cue":                    "1gVdEkSe+cX5kt9r1OGYayl1YaoIRGfI7zUVa47+fVk="
								"data.yml (broken)":             "5BZ/a7iG2XrMkzFkevChcgjlwIWIwkPOrXXZRTVnS20="
								"data.yml (fixed)":              "SBssVrrkg3KYd9D16GewG6aBjTuWLnAZ880OVmcdhJQ="
							}
							code: {
								constraints: "CkSdpj5Od+sChVVJxHI6g6kcv381B3R2kC/EToqxgdI="
								definition:  "oBvRHeZsJHulZz9WsEtI/TwZbjwTIFLo45usZxKh+kQ="
							}
							multi_step: {
								hash:       "QOL2E09QK3IP1DRLA3GCA84FPE0F45FT3DH48U2F3LE3U8Q7UA60===="
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
