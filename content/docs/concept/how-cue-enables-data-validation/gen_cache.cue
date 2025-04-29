package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "2RSQ1RSL4ORstWcr4Bb+tNpkmyBcnGV8ngtBeikPPnE="
								"data: bryn (broken)":           "z02s3oSZyOWCZI37VxAv2SX0PH2UkeLC1VEeZqetSNI="
								"data: charlie":                 "1gzZN7HkOt8r8VrEjoYfs9+sUMZCOBvxzfu5l/yHXto="
								"schema: CUE":                   "h7AhiGRa3Njluc9Yi+ZdBayiHDfQP27gpUg9o7cI18o="
								"data: bryn (fixed)":            "VGJxPhetv0gYKHD7y3msSMPMKw7DYkggBWsd+Ej85Dw="
								"data: alex (reminder)":         "K+Tk7sHQ6W7VBFRo85EGzwfe8qjMKZRjYnknM8Yzok0="
								"data: bryn (reminder)":         "eCCbqIbh4fYfkT2i9ovpx9n9h3nHFqFY52CMkO6cL3w="
								"data: charlie (reminder)":      "UUtIMonMv9APzv2r3A5KyD0hlDEj/nIvp2YulVOxR9A="
								"schema: CUE (reminder)":        "8iButqt//LLp8pIx4gZXEpnjeZZY9FhVXOvftZxU7GM="
								"policy: CUE (too restrictive)": "YIgM4dvNU9XfU42In9YjRbGeyvfRd7Y0feESbFsaobk="
								"policy: CUE (correct)":         "25ttl9xRepIKXLNMF8V35xoRToKH7oNVOyf2Yvn9Gmg="
								"schema.proto":                  "M3/6FhC00/ycKToLIXv/xsddvjWjrLPxeB1ure9ROZo="
								"schema.json":                   "vIlbmiCfesz9KB91p4BAg8px0CFlyXSjk81z++LMdg0="
								"policy.cue":                    "iHG69MALJvAVrUX8fmDO66kacfuhs87SPb/tHw+H1+Y="
								"data.yml (broken)":             "tKi1Cj0+puPM5h3gbidUc/jegLBwiIoRXHJ9mmBmeIU="
								"data.yml (fixed)":              "QtGX5722jFrWndxUxTozI/fd8Qf5ui2YXfJ2Ivp/FOk="
							}
							code: {
								constraints: "rF4Q6PTQmXsHfTQBjG3ZOHmUakK3VVyJroVlT3vXemc="
								definition:  "Pgkck5aM8GMTW3edjda1g5NspwetDR+TQ5KvhQEtlw0="
							}
							multi_step: {
								hash:       "B2OCP8E4HG6998J35OV0JK805JHHEED08CG28HI5H7T10ECU1GSG===="
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
