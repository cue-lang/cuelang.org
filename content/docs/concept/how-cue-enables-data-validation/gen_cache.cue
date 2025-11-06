package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "2OHhtIZFjRUU8Aqmw18ceqZeydKAIMP5n69nt2AhmvA="
								"data: bryn (broken)":           "a4dTmdfRgaGfhSppy6Q77D6wpSGVPHzwbEIwOmGhcZA="
								"data: charlie":                 "ywdofHJwQ94XnVs4Eo0MUv2bytX1jUBDjLtcc8k3tEA="
								"schema: CUE":                   "+eyJ5EThAwqichEzqM5fY63yWZCJLPFmc/7dRuwUoCo="
								"data: bryn (fixed)":            "52JVuTfGkgnF9pdshMFg72ZygTQHBJs9C/gfFnM/4Rk="
								"data: alex (reminder)":         "cDpt5QxdcBbq7T6O76Zzw+CX8FqDrabiJMwr7aeG38Y="
								"data: bryn (reminder)":         "rG0vkWxy2mxW0kzOzRUk2DOWQDRV/9oaKctRUpNh7AA="
								"data: charlie (reminder)":      "XE2CWcOcUwvo2X9EoZ+RiwyB00ImQv1EhiUYmbPSxvU="
								"schema: CUE (reminder)":        "gpOdeFbuXeQtmbYUY/5dKQPX0yFs+edf3fqgYcrmVDA="
								"policy: CUE (too restrictive)": "8+rQM7eNQOB/BmdXkALzJZGQt9MKTOAoJg5f+SFk2jU="
								"policy: CUE (correct)":         "ezMBW4ykxzl+rLHWCrQgj9NLzo8Uz6WfCbxAEevGbs4="
								"schema.proto":                  "+e9dT8e5uaIsQQqMA0jIYjp9cQvrh0dYdLTOoy94HJ4="
								"schema.json":                   "UEmQsDHKVzqqgmJj7XQZ/ryCzoklKnGq5Ni9dvS4yuk="
								"policy.cue":                    "UN3tjHHCFB1/KmvirK2MehHXsTIHMBX8b19TQRvGFX8="
								"data.yml (broken)":             "tBvIfiGhYWdvnZTWP0M7QAmFoy9r4fSvS0jSCwcC8C4="
								"data.yml (fixed)":              "dIY4l+C8xSK/V/MAj34CpPaer/4VYaKchx9JZ49om88="
							}
							code: {
								constraints: "gIZ1M4FqqUNAnKkHbJj942/LxG/3z6dAimcUXMVoLXc="
								definition:  "2OCQKBbakMKS5nW8ORYqHSclgIZu6UC84ExRwpNK2IQ="
							}
							multi_step: {
								hash:       "N2G37J7O8TEG30ROKT9N7P08NC6I12I18C4LK365NIEAIQAASA9G===="
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
