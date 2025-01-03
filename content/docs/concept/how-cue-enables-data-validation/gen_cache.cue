package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "4Z/pSpynM1Lrc/dPXlrVT7FvXFlS43fIjBSrPD5oKro="
								"data: bryn (broken)":           "M7l92eQ2lXdKYYMVCUWHpHK4rOC5skXlJwvFnMCmTl4="
								"data: charlie":                 "wFlSZ9Pk9psgY4tMAJitrr4KD7DRiuS5nt/rsKbcnX4="
								"schema: CUE":                   "3vwio6VeseerivPo464kGTLzmF8Vij3ytu1IJOtv8LA="
								"data: bryn (fixed)":            "gLq0x2YTKGrr/rgUv0oatMlQFMNJIqYhL+jC/GHKy/M="
								"data: alex (reminder)":         "H1RCzGcSEffqEFWgq1Wmd6pOr/GhpEtB4p3cwFW8LtU="
								"data: bryn (reminder)":         "gjus3tzsZUPoQrio9WBk45FCC180nYnxtTJZw2F57oo="
								"data: charlie (reminder)":      "EPmg2gGlDFWwnXvKEmotuckdMHQ94gT3M9VF+0eRMA8="
								"schema: CUE (reminder)":        "6PKR7aiofWdO8XenJKpKxp3ggrjFLefqMKoJMJJhlcM="
								"policy: CUE (too restrictive)": "n0ELilc1yng8tCGqYYldCTvCydmxoQcpojNfUDPJdR0="
								"policy: CUE (correct)":         "pa54U04yp1FS123lTYu/Iq/ljGAoo6VaY3JXI+vDb70="
								"schema.proto":                  "BUL2/ZKqXbPYClXieFkP3j8s8zaE6zgSsKjpLB+Tr4s="
								"schema.json":                   "xz3xyeI0R7wB0NHVifnmB388E9p35joPCmrlQorhXNY="
								"policy.cue":                    "+31+gCc8J7gzyd6MPAg7CmKz+tcCU71oyEeH3Ra1Xb4="
								"data.yml (broken)":             "Q9rVaPbye/cHbMup3mUUfQFJJJewjLnl3JN9IF+gvfE="
								"data.yml (fixed)":              "sxq37xJPcT2yMNcdPciqkkTqtFe8Wgz16mbC6bq8PvY="
							}
							code: {
								constraints: "C2znY491Qk1U0cEfRMGsZGfAqL2bbtLWFQyjL4NmyzE="
								definition:  "6GROD4i2X2hTT9XUAauDHycFjQMgA+3ehoO1K4p76c8="
							}
							multi_step: {
								hash:       "SMB1Q7GPHUTTC7AIJQ3RB646GV4P9TKUJRIHREVUQGSOHJVCM3C0===="
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
