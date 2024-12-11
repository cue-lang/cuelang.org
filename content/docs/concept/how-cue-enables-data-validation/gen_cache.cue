package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "nSC4/dJsukrk3VQCBjNpmNlQKS/FIOaM1obX4uxMiME="
								"data: bryn (broken)":           "5W34MEGq6WUgw29UEBFZswWeSZJN66aWwyUdxhfirnM="
								"data: charlie":                 "Ad6DoSlKhkv4VEVO2GlJwFXY5e8akLiUYf7tpgwV4u8="
								"schema: CUE":                   "fZmG3Xb6xW29oSJc2pMBiNsM3T0n+o7JoHyfKHbOdz8="
								"data: bryn (fixed)":            "nQPu5qbe2LblUZOfGq83FGbrYc3N5XZQIdwibrXtL7w="
								"data: alex (reminder)":         "ru3yY0bWdTyxmpJyCyhFuEEI6Wm8ypmqlcVrqjN5EW8="
								"data: bryn (reminder)":         "WNBNNuJLC49W1pt1BwZD0djgyd+UkWBolCllM47m2ig="
								"data: charlie (reminder)":      "y8VQUp2egLY29OoKyKZoKd/QbIdnEK3A6Ul+JutqEaQ="
								"schema: CUE (reminder)":        "nL8YXd6pREkXorryzKbYcu5GXTJYoohuuG0D4E9ASXY="
								"policy: CUE (too restrictive)": "evVuC/g9h0DkoL4MUXWpAATrWQdeg/ngq5onMiTvAQY="
								"policy: CUE (correct)":         "7LRQ8K8ofXqPT97X/4snR0QUhnMuAF2v3RWYgvQAYyQ="
								"schema.proto":                  "8k/5gBplR+aUciEfXqAR3dhHmPQ6+8kKkne4QhjabYw="
								"schema.json":                   "PFIMf2yVciXCkmq95THFoB9faO7yo9uhhYpl9eacvFo="
								"policy.cue":                    "UXtNcyztuAAiXiggyC1kt1b290UTgEUwxBfti3wdo+8="
								"data.yml (broken)":             "e0pB+s7546EZ2gsw+E7qYWQWjzdClNv3HJMu8hRFgaw="
								"data.yml (fixed)":              "eTGo9WV0McE8jSEaKKrftMbjvculA3VqJ2JZISKJnIE="
							}
							code: {
								constraints: "64AbhDIFzLoClOo2m+28jHTH4JW4NR0lM9EXBuqISYw="
								definition:  "fmuUNc2Ny9DLyV1lNi0Jw63diVPB1IRvQwqyOR7pxqU="
							}
							multi_step: {
								hash:       "8JS5892RM8JBG6922VOHSJSQ6CEGISCQ84R7D5Q4F7117GH6JR8G===="
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
