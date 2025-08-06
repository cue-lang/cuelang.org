package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Kyc1WNRQu481ij0fzSyZWTKVtxDvpokEvqpya+SXvmI="
								"data: bryn (broken)":           "w8oueT2OflrNlGBeZ6cXV+h5fLCzrJ+CSEfxi4WUkW4="
								"data: charlie":                 "vvpTTwS6aFFlE3KFCWOs+8s4xBQiU58bzrj++ASdXTw="
								"schema: CUE":                   "KytEvlBln7uxp1ovYlhObdD3oYDTwRtXBIQgwQgSBQg="
								"data: bryn (fixed)":            "x3P5nonoftiwm+a6KBGOSDKbksNiUGiiKQqUTdNoRSs="
								"data: alex (reminder)":         "mjqLkzROnJiWLzgtPV74H70GjuS4loVshZWDill8sWU="
								"data: bryn (reminder)":         "N4wD2gbIIA8zK2g24k88gzN72RBSGFhce/zY12aWihQ="
								"data: charlie (reminder)":      "cbP5vm7hHwCG9U1jfhbIL+aiB6gO/MUZbyQ+qmQPgVY="
								"schema: CUE (reminder)":        "w1zQEuv0x8CRrncUzKkSDXJxP3P10LnpKIo5HZrl1dQ="
								"policy: CUE (too restrictive)": "51rjmm7+7jeO0T84wyOVbNakienPgP6VU/TKwE0UrOQ="
								"policy: CUE (correct)":         "eJwygMesQGqBwNauQ06OBpBH+AntWkkqBL9hiKvS/yY="
								"schema.proto":                  "1eZro40fQQqV5A7kln8LMDwXiYjdFan0VydU3pZGPYI="
								"schema.json":                   "4TpwR2sTs8yuXTDJiov2MuId3GWcaMfA6yun7ZfKcSQ="
								"policy.cue":                    "y9edfzVvvhSdofTe+rI5TeOPjcVMcRbMg5fupb77W3k="
								"data.yml (broken)":             "CWYvKlAzTZG1HOA8Tpz4axsIHNd6dsFCnICG8vBkDko="
								"data.yml (fixed)":              "UFWUqidVlVwWGI1Q31LiYA1xqGQ69u4UADgquwajXCU="
							}
							code: {
								constraints: "UycNOZh39RIjUbCT8h8YsYcPrkZiak9NApj30yNbrRw="
								definition:  "q7zKo5oLNYyfCsZcreUJGjhQGNmHcgQ48LXGUrd5Qr4="
							}
							multi_step: {
								hash:       "T54QSOD76D1MLR9D8OKEP1JBP2NK8QVIBCO6DUTUMDJIAE4TAGA0===="
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
