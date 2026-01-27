package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "czeYWDAlkCYvRTEgQ1Na0CF56yzDZ/rVsp9F0/2IxLQ="
								"data: bryn (broken)":           "0fqZxBo2nrKcE9ZTXGZ5gANV4j31H1avOWv2Wd4TJQ8="
								"data: charlie":                 "czLXRsMlmmqzRUrzWZ3wSZIKsP2J/fHUHWDVBmeFpbk="
								"schema: CUE":                   "1I5ZroNPDHy8G6/MIRXE6eimNnYJiQlTzDxh4G4fVQs="
								"data: bryn (fixed)":            "hJyuIlGXXl8GA+kDLlZQck4QucMBg+tMA7O5zEZLvpA="
								"data: alex (reminder)":         "rHKakAb4gIIjB+GIWBlfQ2GYwPq5zH5vP2IMyGFXDEA="
								"data: bryn (reminder)":         "uUcet0JCSlr/lWV4dy7kzpbpWS71G25ToN0aYgKu9OA="
								"data: charlie (reminder)":      "6aPzHFcMM1JMWXu65mEXmyoNoMlAycQEIqaPZ4yW7a0="
								"schema: CUE (reminder)":        "PhfH7ER7g/IcLFS5rvdkpz6PE1UT99Ml56+r4/nBBpY="
								"policy: CUE (too restrictive)": "0f3y9j0163721tpz/ISUbOIxy2Vsku7djoPXZheWt7o="
								"policy: CUE (correct)":         "m78tbLOZE4Zi7TnaxlYyKaExXcN0eobScPQS54apGKI="
								"schema.proto":                  "felw1h3xd6WupteCmVoyK2YSXM2BkzXNmiyQiENVjaQ="
								"schema.json":                   "5aUiPOTMe8hSeTOsDaGdKYKpAlZ14ybiN7jv/Lk7qAo="
								"policy.cue":                    "liiv4aOi+IcBwp69+55L8EPxpUKWe9afPJ2t0h9p9Zs="
								"data.yml (broken)":             "Vbd4Sc6fX1y1DWcWPtlxfiq0FcidJv3rd0ebEU9hAGI="
								"data.yml (fixed)":              "fsxQdeFd3VNPdXkt/gnWqVCnw+gbV3VSbk8R3tAM758="
							}
							code: {
								constraints: "G1SluOjwI+8ihQT5VwnAMkt3K1njv8x31HyxXmVEELY="
								definition:  "nYi963rHqtBwDQc/GsOzomUNnYE2sUx3BT8W7zbdxGQ="
							}
							multi_step: {
								hash:       "UKJ7ID4LI40SMU3JVSLL5SU7TSHA2TUFO5VD3RANU73FPT8KB7PG===="
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
											    ./schema.json:9:21
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
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
