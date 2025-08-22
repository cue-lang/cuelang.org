package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "7MH8tLLvzXgnL1QFcW0zK39CPdCj7hzPNRUyZJkmsVQ="
								"data: bryn (broken)":           "LJSuOcDR+To6a4ENq8Mnt19Bl85pQpIWEvHS7p3ur1o="
								"data: charlie":                 "yr9Y8lYUmm+4Y3nf6opmJTxyj5NG+9gWqEVZPeUr464="
								"schema: CUE":                   "UW7wJ/P115ZvJk/5ysXS+cPXhitYVcl360dVQIZYvPM="
								"data: bryn (fixed)":            "cvyStwpYnVdSngqtxWLqgYo6kKEjBsY0nehkGZ8kILw="
								"data: alex (reminder)":         "ZOriqHZGv/SlsZ0R/PKEmJe9ZdyVPTiqbxNuOoFUI14="
								"data: bryn (reminder)":         "RKg5apT9pfI8AimzgevJV4h9lP/GxG0u93BnX5eTIDo="
								"data: charlie (reminder)":      "QjgDigm1MWP6/G33fUst5BDHmXwoldyEiXuwt6Y7szU="
								"schema: CUE (reminder)":        "MBt1IIT8lFCWYhyGvRLBdxJV8AzLn7DTkIbNM1AAoGA="
								"policy: CUE (too restrictive)": "kO1JB58554T6egbDNToDShs+sH86CEkhYhl/zhhAXkM="
								"policy: CUE (correct)":         "7qQadDQSOTA9FNr4s0afYuPo7DDlDMAtgFdpvH7TYH4="
								"schema.proto":                  "AQz0YwwsBD+S//0EJoBB+x+YsvLhXijdUHq3lF9cpkY="
								"schema.json":                   "gq20BVZ3KJijv9agKL51Dw5eUwkwIyRoy0YCtp2gpzY="
								"policy.cue":                    "AYhFGNvKeTnyoDPMZ26MhuKcKYVeQxDxLruJATfIgMg="
								"data.yml (broken)":             "a3eJw6/yoapbdK+dwGw2QFRy/mpYGqeRn9dTNVPipSE="
								"data.yml (fixed)":              "BBRLl50sA3sFrzp16KpwVm2PIYa9ROnmczTgKkT4N2E="
							}
							code: {
								constraints: "bt6u/f/TWT+G91t0eAeJ+WAtYHF/wmfGPptc8vFWacI="
								definition:  "ByyH82JJATqR4EyWT2SvESDSkoeDUczoFMzaTp2Jcw0="
							}
							multi_step: {
								hash:       "U1549BA3GCE0118BP886G9D2A60V63HIICKSHF3B431AV1T1JKPG===="
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
