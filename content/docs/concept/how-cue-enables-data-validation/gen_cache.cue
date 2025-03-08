package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "oDdQjvhoNYQvNi/eQiBhAJ5RqgO2Dog4/GxI5ikARKE="
								"data: bryn (broken)":           "8x4H8MjXaaVw0oveq0AGaIMcO1R1WZS2bTLkESYaCBQ="
								"data: charlie":                 "b7AhAtWmVzMnhN5DbL/VFSIXB/Mf6I795ihrh5D9HK4="
								"schema: CUE":                   "bU9VoipyRpCZgUjbQY9MgPQZP0Z9arfgyO5bkyNuj+A="
								"data: bryn (fixed)":            "IVUjnq4U9s17KT24f3AGHr7UoPTIXRvEUNmdfgk2kjk="
								"data: alex (reminder)":         "8lVP2OGqjdih+WvBp6BzjxoIBNkUG63bWbP6NVG9PGk="
								"data: bryn (reminder)":         "UlNf6vV6ZQ1R/LHp0dog7vP3NQpu8+LXy0mtcMk0qI8="
								"data: charlie (reminder)":      "e44n8QvF7H6T2NVEvHF3ZcVIc8V2KxVPH5mZy+SKIA4="
								"schema: CUE (reminder)":        "ihQNTOiG2MtKAFoZy4CcBuOLjAV+Ixt1cnKKcu9rdrs="
								"policy: CUE (too restrictive)": "HfyaXWWbLyPiz4OOt/tAmD9GgjMCIW6FvLfcO0CO1rg="
								"policy: CUE (correct)":         "IupQK+HNSlcYMj3kgtBoXFxwmxnFwkZOFaiD3tIe4Y8="
								"schema.proto":                  "yg77p/6xOWlbGVUnoCvrVYlc3N9AWW9WLn4kAyKbALc="
								"schema.json":                   "stfnW6Jo6v6h7voLvZv9pKyjQ6sJ4WOZPN6ByetAxlA="
								"policy.cue":                    "Hr6cgezICFSBtaqZEE05IdK1ne0gaQaeDAkA4vDuelw="
								"data.yml (broken)":             "b+6GVD/vrrs0+btOnrBtwk8MNGkyb+hsN8OR1F6QQ/I="
								"data.yml (fixed)":              "f/wJkDYqYvqitiCTgZNu3oe6ebh3XPS/TDfSHUNYoIk="
							}
							code: {
								constraints: "B+FvaexlTKd1Siz7PeAm86ZzbHmcjpSeSV66ige1AzQ="
								definition:  "8GOlPSGiwJ1+kbqmV3cGmBOg74bD9Q9W0beqr0Twi8c="
							}
							multi_step: {
								hash:       "52E1OLT0QK3PAQFN02TSBNP6ACK16NVRK7K3M8N0LIIUKEUHANF0===="
								scriptHash: "5IRU0HUMAKN4O1TE41F2439MMECK8AS890TU89R3REV16HVJRUN0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
