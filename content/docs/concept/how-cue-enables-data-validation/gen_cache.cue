package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "aSvFz2vRgIYJMdp/eQ+e31DHRoX6IiGbnZ2rUuQ9Hqw="
								"data: bryn (broken)":           "o/xAWDQBNB9yvtAWj4YeEY3g1YQOmYwHDndfgAKpGSY="
								"data: charlie":                 "lk1y4O+QsBmG01Vl8H1nMj9h8zy7Yhd5viWdLPg0aV8="
								"schema: CUE":                   "sqx5/NDrbKqI0hzIKMHXds71AMDcNEnyWLBlTz+/rXE="
								"data: bryn (fixed)":            "9nEMgOBwJYRhu9D+6R1ru8HhdSoMPO5RlTl7wgVsYco="
								"data: alex (reminder)":         "OXbPFTIBjqVN55vbK7lhy1Dku3343bo6QCJovRQLfj0="
								"data: bryn (reminder)":         "F4lhU/0vEnUhnhcvlsFo3kOFUmVqP/oYeVLGKIBTSXw="
								"data: charlie (reminder)":      "GtBgH9OqjH0IANGHvuRiPZHIFJpnHg+pnhDpbii3jDs="
								"schema: CUE (reminder)":        "Lpx0mP6udT8so6WQR3xCRei/aHlvlAoA4cNiI/xFTDw="
								"policy: CUE (too restrictive)": "AwPATkVXs9XLzKTZciS45R2md0c5ZktwAFYYvmR4HMg="
								"policy: CUE (correct)":         "BMmg6ROSFPY8XSh7QZrHuxRmYQbPHPUYf3m8myUGkxc="
								"schema.proto":                  "ykg5l9+LwZW8gp0ScDMpvWhaNbhZJ6+rgHWM/qB451I="
								"schema.json":                   "BTfVLQQt8uGB+PgwG6OrvC/NaKJD4Y9ZHf0ByOEREas="
								"policy.cue":                    "Bns20RGzgppBywlf/LyyKfWCOHWdZD0yTjXsG28o13E="
								"data.yml (broken)":             "7+A7t/STyEffM+Ws6WXz+52M6UkNEQGrLYlmfjASuOI="
								"data.yml (fixed)":              "hCvk/XCUrvTL+XTAHijvIeT/3C8SqSLIwTwSSumfD7k="
							}
							code: {
								constraints: "uGuJoswvhYWm0Rewm0PKe3w47XtU05lYNn6iD4syA+g="
								definition:  "hsh8JhKdk/88LVYz5PvIlyNHZoBZZEUJmUcTnI5aovY="
							}
							multi_step: {
								hash:       "EFUQR0C9KDMTC1R8RE22OV42SG1KR5JAVDIFKG7SAPL2DF2803R0===="
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
