package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "4MbKFKhtdR7w+M/kP6G+C6fq8ifmvw4+dTJ48gQ7Ivo="
								"data: bryn (broken)":           "mdpqZ2vTaEXa/VCq5P9X1qF5AVjkJn2NgKrO6bmsXP8="
								"data: charlie":                 "43S6FqiPnNuOhHlRS9h68EoUwDFdXj7VbuG/4meIvsU="
								"schema: CUE":                   "e7tnz3tLw5AUdb9fW+5LJseX1nuOravKz71yDqS2l6o="
								"data: bryn (fixed)":            "3YIcKCJOxEvt3WLEOhNznKlxG2LwtFmUgjJkPfPPR7U="
								"data: alex (reminder)":         "TXwkyUW0JDZ2nXph577a23o8APH/r3ahP04dpLTNKLc="
								"data: bryn (reminder)":         "IkMv6v766KKmiuJRPFWy1scf9oNKUNP4TMBs2hV1A1Q="
								"data: charlie (reminder)":      "16oXnq913f2Mc1XkBIpkq8/kAtzUyzn7BZzSsikWUeE="
								"schema: CUE (reminder)":        "P7fybWm0p6XypJo1UuGUBAGc+SsDCqpuwn5cxK6ZLwI="
								"policy: CUE (too restrictive)": "jQ8x2QTLHiRQEyfG5RwW2dBgQG51hbQXbSFjKv/zZD4="
								"policy: CUE (correct)":         "iyh/edeSigJmkprcJn9VLnZyFHokFVOyBwZlXF4O3iA="
								"schema.proto":                  "rmmM8kXlLVMqFeSa8y69HNCrGzRRlMQOPZ02g24vm5g="
								"schema.json":                   "VZ0ipl27ciJ8Rf1Esx4dqh+Fmyi/QmFEhAit8f9hvKA="
								"policy.cue":                    "L7PvccqH4Muz1wwjjL8kywMA4tvyZ43mRv5kZJQN1u8="
								"data.yml (broken)":             "0Totl6d3IwIXS/XY18u1LDS3X+sgOi0Z+QgVtKRZXis="
								"data.yml (fixed)":              "Ollpd94YRoGWVKIYOznoEHwxWkcxERd4w5cVKn+3pb4="
							}
							code: {
								constraints: "5IerIi2bKoodqyRdS5B7J9iS5/5f37xz7pB6qqUUfns="
								definition:  "/hb4nMom4PLSG9VGtQa0q9kRY/AJ6DAosbCzgt0gMD4="
							}
							multi_step: {
								hash:       "V458521D5MTHTV5T3I3821VJF9AJ52PHEJS592BAUQIMKDF6C6DG===="
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
