package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "raKvcLyVoHVkq3aomss0MpwZfuHFbKnzVvrku6EUgEk="
								"data: bryn (broken)":           "j498p+e6cRMckjzEUAH7bc1dq3qwIce/MaHu7DZV0io="
								"data: charlie":                 "aPYjyeWiiep0/h01kpvR7Bm3ybfK/IUPWDHaVuvzPsE="
								"schema: CUE":                   "EWLAwcU7Dqz5fcFFM4ftm+sincC4iQMvvUmsay+fpeI="
								"data: bryn (fixed)":            "G/tlG3owB64kmZVU/6tgWIEm6eFa5y8eJiCrlxlIB9s="
								"data: alex (reminder)":         "whd+AzVg8c0ea9UmM2/AE4uZaFVpbLNiBGpK6fFdBO0="
								"data: bryn (reminder)":         "pggF1EYDhpGUXnYdXbIBQ25ZiFss4hKkhfznbjGvzz4="
								"data: charlie (reminder)":      "1QgCuOVukwgPlsuTIOeAbwZnJUBwy2//QVm7UBHaSHM="
								"schema: CUE (reminder)":        "7Wsup9pafZwzqxXamdKXFOleMimxujyQb32pkDcghfc="
								"policy: CUE (too restrictive)": "tH0pNHHlh/hG4m86NQNZKdoh2FNbKyiJp8d/Jk5wThI="
								"policy: CUE (correct)":         "vUYgB3m6bYzMIiAswlDYvOuRuU53/3oQlp3g5jsfwhA="
								"schema.proto":                  "wtAGwycdG225++e1HAjEnMMIIYXaln4Scn6eIA1PBf0="
								"schema.json":                   "VO2Lii5d34toNw5zCUk7DDGw8nQyFUa2x4mQbrQOP2Y="
								"policy.cue":                    "9UwWPHMXnei0P1UngtcYaWBGSQfp3gRqe4RHYMVWqN0="
								"data.yml (broken)":             "ZIPDL7a6fIJoZDkTipul4+SorGC9WASg2H4BhieWkcE="
								"data.yml (fixed)":              "4s2NM8kWcqhn2I3G+i3+Jc067x7UY+rHEOSRpDDy4UA="
							}
							code: {
								constraints: "P74irtXM8KXxeLTXL1LSvYmJnOoLc3J7YCJ2cY776CI="
								definition:  "vjtsupHL11obfGnfrKOy/YbFSBMmGdbJ+Ide5eb6SRw="
							}
							multi_step: {
								hash:       "9PC8VTTRPDH0UG4FRIO57G5M7BSKE1SUPT0L4E6OT5B62HJPJTQG===="
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
