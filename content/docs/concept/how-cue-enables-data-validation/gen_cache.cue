package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "wcmqA6FEtwS0r2h8APjSpemYWWKJY6t7dXvpTOkWdTo="
								"data: bryn (broken)":           "Pf7RQsGy59xr4TbzjeskyPkUAUl0a9XpGMw8rYwRwMs="
								"data: charlie":                 "62TUpdoohHeSTMVSBJD3ng6fXupa9FQUK+m+hk3gidg="
								"schema: CUE":                   "Bz/sw/q98Se1y98/M/78Ojk0W5l6eFTv+BfKuid9z/k="
								"data: bryn (fixed)":            "WCsJRRL7aMfqObl/lDejQLWjH+yKV9XKrQVYmfHhcHs="
								"data: alex (reminder)":         "oP6rWil9NUA/GeY9IhPiYIMAnplUlXUS9uVzYBpOHSk="
								"data: bryn (reminder)":         "q7nbgznkgDflPpL94GY+zdyIwwOub5/BZGHtbMpG7aM="
								"data: charlie (reminder)":      "azbDptV3+Ctnt7tTQrseKW+OEqQYJZfaqcP2S/SIp0c="
								"schema: CUE (reminder)":        "a04UMpbs66sNnI9s48GRv3ymjQwgF15uoSJzJxbX+v8="
								"policy: CUE (too restrictive)": "cMqtEQDqbp3blVF8RGZOphjK/5cfGfVGy4w4cmvIYcQ="
								"policy: CUE (correct)":         "ez9SzzFYg758pFsQzL9o1TlSGoYgUYCaIXwmKSN6TAQ="
								"schema.proto":                  "TIM632f6dhwYGukbGp4OWmxU46F2OplLOUQ6NlPyRlQ="
								"schema.json":                   "QxAEMP4szoKvBUjszFyVsi2Ogl0cJRDW2x1Q0aRZZGI="
								"policy.cue":                    "ezDYH8hS+B9ey7ccxISYauX8A4pN33XUBugqRd1d0A4="
								"data.yml (broken)":             "3R1dnTqGaH0NT7YuSVCVlxojALPRZ/niOJwqsEPcFyE="
								"data.yml (fixed)":              "T+YjA3yYbdRMb/X+mlyF+kOaNMosrt2QmoCWKcQoTeA="
							}
							code: {
								constraints: "AQTPJtRmyeMg8bghxSFmnc4HSo6gLK1Y1+XwydFyBJg="
								definition:  "JHr9nn7iuWMZfeKuRYXLdwRsQSeazNfxhu1JEYXiYtE="
							}
							multi_step: {
								hash:       "7AK80GBHBE2HPD0E40N09D5EGVQIBAJP5L0BJ1HEDJ5M7ORG0NSG===="
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
