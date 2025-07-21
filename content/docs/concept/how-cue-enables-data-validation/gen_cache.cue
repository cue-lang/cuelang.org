package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "tddr3wh+1RrLEGOxWGS7zxcWL6qrNbfkZnd9czV7tGk="
								"data: bryn (broken)":           "cdsf4EQVP3f/uoIfEPwi1qBfPq1g7xMnayiMsrgWHBs="
								"data: charlie":                 "W7LqJDH9o0I/al5It1r7xyq3P+iHjs6W/Xeoim9WWGE="
								"schema: CUE":                   "NtyOyy4Qu45YdXCOjUSTRd2GMPDAH4aEvUyUYlZV5dg="
								"data: bryn (fixed)":            "EZzceE3wH8AP7wmIlHPY1WlofwcybPIui5/V/b1PTdY="
								"data: alex (reminder)":         "8OibW3eqvLZT71fs7ER3Wkea/Q0Ln2HtY66sFEOJq50="
								"data: bryn (reminder)":         "ysI7u0fEXwbaH8xhc6tPbLsy6ejXzgHn65V12cxjffM="
								"data: charlie (reminder)":      "PcF7+qOW1VSI0H1sO1eCOl/yOFSk62aIJl8DpifNsO0="
								"schema: CUE (reminder)":        "S3eUs7rs18Bx69OhT/4YJdeG1Q3vWIrYifT/5hBDj5Q="
								"policy: CUE (too restrictive)": "jbZw1pW4lz+A1eqzTGl31L6bJr/y6Fb9vZ6BL+mn824="
								"policy: CUE (correct)":         "teBIHWlWasJKzOY6V8d0eyaQuUdRN/JV4RstWsrpDCk="
								"schema.proto":                  "VNeih8kt3fQi9CnAckJy2N2I956FsNrY7G84tXxrFv4="
								"schema.json":                   "ul5dK43Yae9srnafCcFoyKglRb9ZUb/eNrwIeL97EjA="
								"policy.cue":                    "e/vVjH7eiVcF7lfPMSRbxbxs5Z5pMC3FdDhf9LEezLo="
								"data.yml (broken)":             "3sD32FF39cTeiHoTtv8wDQIPSdweI92Mo8QMr08cmHM="
								"data.yml (fixed)":              "+hKrz3VUjXY3qO5axUregl208Il5hPKBmGcrhMJcxuA="
							}
							code: {
								constraints: "Dejv9lQ9rQKoIALWcMzuHME2o28vf89F/G3ZvdAIhqc="
								definition:  "mAil2VMpnYe1AJ+24fngNipyAdBEl4o3suU8q3vh02Y="
							}
							multi_step: {
								hash:       "2MB7ENEI2J3DTVMR42E7VS8KV4CI54I7VNQVT1NHLB0530LDM2E0===="
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
