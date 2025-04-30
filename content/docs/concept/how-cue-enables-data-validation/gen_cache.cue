package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "g/zebVC4ueVgfjgJ3fVWN/f09Am/q68vezcN/fzlJFM="
								"data: bryn (broken)":           "bF88Q8br0368UxFFffOWN84N07Gr60Gjc3IQzvK9a1Y="
								"data: charlie":                 "7o6vIN/A9QoEClNjEd2IDq0r0DRkYwXgoCHx6lFyFbc="
								"schema: CUE":                   "eWZaOu1a+rPy0uT8R5/3i9P3ydDweYBPYSZO+cnIrL8="
								"data: bryn (fixed)":            "m7j4bm+Xaq8FS1wkU9IXNTF9WvzQ6DzIzrjeZ0/JQLY="
								"data: alex (reminder)":         "bVxJpITAcAavH8WEyupl0vWkjHbnPvFhWu0Sd2bzfZY="
								"data: bryn (reminder)":         "kBxeTd5JBbOQRj6Pz7PrvP48TDu2fMw0NA4TwVPGn8Y="
								"data: charlie (reminder)":      "A7PuZEJZYpFkQ1ROY8UQdj/qbZ/UOoCc8+MyeVEebIg="
								"schema: CUE (reminder)":        "LoEgEtBED9Ie/IKZxQyB0uG5VnTT79kYKKz7CVgwMGY="
								"policy: CUE (too restrictive)": "9D7Czf6Ux1KKgBA/obfnVYufVPdd5AJduS2cLJb8SOg="
								"policy: CUE (correct)":         "g9jifH8m+nkXEGOf6yWIyiG+Q8gUmi+qB/kVeYOqMRM="
								"schema.proto":                  "8KQTbD/FUkXH0EELbFszXTlPtgQX6jBK6ljgwgo0P/Q="
								"schema.json":                   "qs+b7jpINb4mnbG8dBxBQjOelgEzsszblYVyZqfA2CQ="
								"policy.cue":                    "ze3+guabiC6JCGipJiyexnsSq/+8y9kFr0pRYgIBjLc="
								"data.yml (broken)":             "5940KUUcE0fd086NgEcAarCoXnum9C2efTf13VxEaG4="
								"data.yml (fixed)":              "jyYAtRGj29fS7q6S9Du9e18It2hCX/5TApd4SPq5m7o="
							}
							code: {
								constraints: "4++FCLob0I10elTx7Wk45PpSWLzTtFIAnhRLUOgRilA="
								definition:  "BYP8kFfa9RWu4bwyYOb/EuDxTBX3Mi/FNW/K8Jel/+I="
							}
							multi_step: {
								hash:       "V1SHLD8ONPJLMB2HRR9957SAE83RCABKE83CGT6NKCRC3RTJTNEG===="
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
