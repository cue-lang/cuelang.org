package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "J+LfU62FpZ+T38lNXGqZrVRUCKmmCwQyAfy+xA0gC9c="
								"data: bryn (broken)":           "e4FaxPTVdlYsX7vo+FIqSdqwWM0ZRsoAeYlDMSl2cCo="
								"data: charlie":                 "cGzEeXIVDVQEOkW2iuTp+HqIzFXjFQ23cUVWwa0TdmY="
								"schema: CUE":                   "mb5HtNGVmFe9RThWcy56D62Jx1gRBG3T5SRjkbF4ITQ="
								"data: bryn (fixed)":            "ZNDUnEyuiigSCuqIRXCbvgCzFy2cfcLzYydsU5vIN34="
								"data: alex (reminder)":         "LjIqJBfrhA6dmZnDSTg8YGvuYnuwNERyFvxs2eL7LHA="
								"data: bryn (reminder)":         "PPrUc1SPTUpTr//JvRlSnBJg1wtjXcSp5ZuUuYIGXWM="
								"data: charlie (reminder)":      "wBg9vsVB5KBeIIUQlkRi1I0i63QIqavbrrvVbRJxGE4="
								"schema: CUE (reminder)":        "9NK0G4nrcXP7DoFKkZh5W0hYBjDu6L99102/s5Z/iJM="
								"policy: CUE (too restrictive)": "3Nf4Bt0RFBoiyI0nj3Qvwxz+zKsejKYcGmevwIjCI08="
								"policy: CUE (correct)":         "Hsi15ea3HjfPvXLO8pbxomnPnY6o8unQPT888b4uQaI="
								"schema.proto":                  "F/dOzPs10H6G/xffltGsa2CJSIhsn9xrE1sMX4/zAP8="
								"schema.json":                   "IXNd5NkP1AyIZwYG1kTNTxVWefRZtHLSICARJBgRJZg="
								"policy.cue":                    "qXtfNTTTimxNypb4ujZEj4ZcvHlONpE1LEEHYDIK0jw="
								"data.yml (broken)":             "0jFIDW4zJjVmlHXrqG+Q0MqRpntPH36eKRXlg0xEs9A="
								"data.yml (fixed)":              "3QGDFwqd5an8bboRzfO2Y/5bX3QXDh7HXdBCs5F83LE="
							}
							code: {
								constraints: "H8l7OOKLW4HCo3V1N/Lw4Vkt8ySO/CLLMvHsikm09dI="
								definition:  "CQ36HA7vHACGcM9y8+a6LaSy+CXmn1lIOQcio9ZADdQ="
							}
							multi_step: {
								hash:       "1THAF026VE2HI8GJ11IDNGJ5KV5CAN1OU8MNUD9EJHAIBRP9SE7G===="
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
