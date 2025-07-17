package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "pnOP/ctGZ1LqUIerwRZIywdZ31/+Mmre4WLuNSvsu4I="
								"data: bryn (broken)":           "h/ooo97LenhlBhEslpO5TH5ETfkwDZo3khOxpH4dP9M="
								"data: charlie":                 "xaL3yJx0ha7lZYXBAP3lvqXDOl+l3mfOkCyYHbLEeeY="
								"schema: CUE":                   "4IMWAFjOhprdlUxzjC6l2pcomkgW95rWZ9KhKI5a1Wg="
								"data: bryn (fixed)":            "odLftNa3/BzX3yp8O0a9coeHogNIQBH6bw56c+OrEQA="
								"data: alex (reminder)":         "rM5a2MhzR0Py+FE8+HJGFgnWSrz9hJWsQc05eOXiMFM="
								"data: bryn (reminder)":         "onJdAORwZm4Pmtem1Arw+ELKmHP4CiLLYBhzrB+Lyw4="
								"data: charlie (reminder)":      "GGJPcEGGBdmIfMQhXHlUKz1OAwNs0N6FwNfLnA5tdzs="
								"schema: CUE (reminder)":        "EyaQY5OAkjGs77avQ6jFW9qRGcI0apHyiLioyFf/5+Y="
								"policy: CUE (too restrictive)": "9VXGp5c/quPMhszE/cXUaq2kJACtbOGbkz3eKhlrzZc="
								"policy: CUE (correct)":         "dEXseck7BlScuyM0u35eFxu0NtYq/OWv/Sn4JIwf60E="
								"schema.proto":                  "3w7L96hU6RzebrAPNKHofhFRiiOfFgj2oFZg/xdNCCk="
								"schema.json":                   "6SBh0wRpM2Vt2Ro6VPT8rlZIGdWQ/PuhITb/goah3j0="
								"policy.cue":                    "hRIV6J+HVa2P1yvJuG0fDowYLoVMJOW2mJHOAu1YE6M="
								"data.yml (broken)":             "Uvt90pyxpo7140/NyypQ38irOHNktxpYmJynK4U/3Dk="
								"data.yml (fixed)":              "nHKKp8LnjTmmo59fr3HjF5Vt6upRtZEhrbFstQZXBjo="
							}
							code: {
								constraints: "MCY7FmjWDbozHNbSxm7HFYh8JgYdTLpDNfCM5w9FEm8="
								definition:  "jAAOguin6GfB9xgc2M+Ugdv13kh5SOAlnDS3H/QuY+c="
							}
							multi_step: {
								hash:       "C9TEKE97VH88C9E7P3QSCEO3I2D54KPGICQITQSIMKE0FI0G9GKG===="
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
