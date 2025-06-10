package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "yLb/a+EobMBHcJ3Ycttn4wQmRCab+oIg/hvCoYwnshc="
								"data: bryn (broken)":           "qTJh8HzHbH1uVJxo7KTjJ0yKuLh4z1Nu7aLUcpbyprQ="
								"data: charlie":                 "oWAcS2dyEWRCB7poubX6Ejh4LaHrzrwnQlFBJssBknc="
								"schema: CUE":                   "aG344lKTnb2g7f4uusNjayJhAzjHNFaqJUqB/RoadOI="
								"data: bryn (fixed)":            "tbR2gV/SxroS9fUGBHdZ4/qWYHxEzfZXRSiGuUdZp0k="
								"data: alex (reminder)":         "UinYLCQZj3rjpx+cgy4iUiSZC2OsrvIhF2yencBglz8="
								"data: bryn (reminder)":         "26Gq4YzrzTdB686gvSKsG6+2NpgjMHJKZKryT8y+U+Y="
								"data: charlie (reminder)":      "oC6eZkq11cQ6l+kanXh4mJemqoV6FyhVd+M1pEIwrCw="
								"schema: CUE (reminder)":        "gMTMb0JwEwt6NDIgJrzIe5Ca4nprZ6WsapYHkTa4w1w="
								"policy: CUE (too restrictive)": "X5dWOkoBaNpECGaYsEcNall3qQu5Id//GrFn+ueE/FQ="
								"policy: CUE (correct)":         "8D3LDN3BLCMRXKXgypzJjLRjv2VJrqP8eWrw7jC10io="
								"schema.proto":                  "yHdHUmfTHi1wUiBjgZ2izAINB43NJbDOo6NzKpzHrMQ="
								"schema.json":                   "QGWMr+/DfsPaD+eDimwaV0GOQcnKFDlU+3DZfETnYpU="
								"policy.cue":                    "66kJefm9DLXghXCoVWIW+8OniF6u3EL5ftMqKwx7Cd4="
								"data.yml (broken)":             "9oRtHSNW92jZ24nlPojrMWLSt45NLo9e+e052jkK1tY="
								"data.yml (fixed)":              "xGEWJShfY9CZCdw1M/FTevB8IgGLE9laZnbM2EbzV68="
							}
							code: {
								constraints: "lv1OQzclrGhFMR10beX/78du2OmXVrE6xUghmrC/yUs="
								definition:  "C2kjlX0PhhqDlUzJ/Gr6ivzWCIPK7c/Asq6s1382JRQ="
							}
							multi_step: {
								hash:       "S08TJL6LTMIICJ8HNS8FG96AUV0EJVF11TF3A1SV7LBUMD8FF41G===="
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
