package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "MsdDfcZvuLLm1/9H23qfjiP/5jerQTyQEu24/d8noeE="
								"data: bryn (broken)":           "x9QNpvNI5WMSCp9iY9S8CRFJD7vly/ZJ7cGxo5WpBz8="
								"data: charlie":                 "y9wC2bLakLXbA9SImLN3M4Ik47BGAzSPVtuipola6YY="
								"schema: CUE":                   "cYmmrkwBSVIhNYpgyt1WyID1UUpVc4ajdImw4qqqpEU="
								"data: bryn (fixed)":            "2yuDhWaBayUCY/12k/pJV5EKnIc7vlq1I4MxcTq5O/s="
								"data: alex (reminder)":         "GcG9FyQYXDlCk/spmhQh9bndmcx3bYYXmyPYlV7yPXs="
								"data: bryn (reminder)":         "znOEv1p4MpB18BnnYryPcqR5UTpgVeevIjEdrrOaviQ="
								"data: charlie (reminder)":      "CbuPDqSBaOAcz2s40yL7T8YmXOCCRyNb1pZJdF+WsWA="
								"schema: CUE (reminder)":        "kmDFos10sAyxWVzz0dMK8aNH88I/v2mXhj/12R1q6P4="
								"policy: CUE (too restrictive)": "hYOwI8HVoyOvNTgo/lZnvxnvYA21yMqbGtf4PTWW6cM="
								"policy: CUE (correct)":         "dajXbevNQdZuyUdWpX5ffXY0I02vBt5h7Mi5UZuJUx8="
								"schema.proto":                  "GXhyVvTYLyfiYmYQ1DeeO6Eu7I+lCFHORESq3/Qa7P4="
								"schema.json":                   "yburYR/5ITG3WMl9O9pNy5ssFPNuOvFKpvs1KStdp9k="
								"policy.cue":                    "OYXss7gzctUX7Qt9cGCAbTkXAi1Kz5h96ibelvg+5/A="
								"data.yml (broken)":             "FYod3CoW8YytwIV2VDBwU6NIyGKb6fkHxDo196AY94M="
								"data.yml (fixed)":              "CmjyUgfn3Z+S+owGarQbHCQxYA0iOdQRtM6WCcGt0kU="
							}
							code: {
								constraints: "mJaTgNIXNmP1P+Kne66ANvcQcMkDxMK7CEVoFcRpXcA="
								definition:  "Tizsoft8DcITfKGj8AxJNTVgBsWDteXFpf0pm9Nmauw="
							}
							multi_step: {
								hash:       "VU5LD178TLQBMEU27D57UCD1GMUBDMMC21M5B0GUN0HC5L62QK5G===="
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
