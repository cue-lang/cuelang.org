package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Ue17lEjsK3Pp/YVCdZSnEDbsjaV+IpHw7nbrRlilkw0="
								"data: bryn (broken)":           "QqwQYvIxlWRPIa9Piw+TVOhOqtgVp55VAYfAbngUJiI="
								"data: charlie":                 "d/YR5y5AQpoRlDVOLPn2OVZn+gLU2pfRbK0ptmVuCMI="
								"schema: CUE":                   "jVYnq4gRX5AMB7AS6qRDCE9/wKImdOlU1THx0Hz/YXA="
								"data: bryn (fixed)":            "1QsVQxjd0W8CRemHr2PyWESL9jfSV+ZVy6tqVvOxfAw="
								"data: alex (reminder)":         "cM8ndEbbOCv1CracJaCgSV2IyaUdJM2RnTNUAKuz5Fc="
								"data: bryn (reminder)":         "XrwxmNsxLYUfYEwT1PLzc+G6bXsN65OQz259G/1YcaQ="
								"data: charlie (reminder)":      "yaIcO/aFWYGGvxVXt9A3GzvEpxCVM/oV8oiUMOuLFE0="
								"schema: CUE (reminder)":        "v/4+rSvl3fnszYI25S6qgbXuDoRaH+yraX32G32E9DI="
								"policy: CUE (too restrictive)": "Af5DqlGyBNDSUwN526Y91i0qFSZ3iGQArpziEzJfMo4="
								"policy: CUE (correct)":         "B/8kCYWKWpclt4wzyDTyOUZRF4Oux/Nf6EUkZs4VRho="
								"schema.proto":                  "Nm1QTNBIsmJzTKN8ADo5c/SAlFD2wTFc/uY3ZrbiV+k="
								"schema.json":                   "PLfNhUUrby/NzII28JfcFNvwuBzeNuO6zAlEiZcg6Ks="
								"policy.cue":                    "hDBNzTkqVErvSEChMyc3ZgzSWE2VmK3gJ8sILoBARD0="
								"data.yml (broken)":             "F6ybqXfDVxN4jZYoF98rR2F+WKv1N9PrEkMIHLJHJio="
								"data.yml (fixed)":              "TwixHojR+czcxmSRBjaeeqcAU/GlCcVbxU3LdD3zYHI="
							}
							code: {
								constraints: "Wwerv/AvoIx1P7XaCA4Q/iwzfOzaWSH+y2yhXgrg9Oc="
								definition:  "ZjjdaSOu7RFLCHmvBx/e36QTzrQjkHDpyZDjBk6hOvU="
							}
							multi_step: {
								hash:       "EDJ87GDKGDTJ57TKDN8QIHI4CT1K1VCNVUH9NRVD1MV1A3HOCI50===="
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
