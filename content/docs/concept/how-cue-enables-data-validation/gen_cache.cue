package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "RkQSPmnWk/nCqZiUIT58hwR4P3T0MWhJ97ejoDLpeBA="
								"data: bryn (broken)":           "YVPKWwVi1j/LfhCsWxClVo4hffSEoShf0DQBcoSrCXM="
								"data: charlie":                 "FGTN+ybTs0N6HEzOK+TkRXD5/Fju2bJMVPW6V5KCz+E="
								"schema: CUE":                   "MTOWC3U48F3IGLRf6hNvvPSFPlIBmU8CtZW456nVYYg="
								"data: bryn (fixed)":            "/LXm0mlpoB3BGDIqUQd9aqRqyE1Qsalwx4J9GF61f9E="
								"data: alex (reminder)":         "EO5sIsMJxIURCW+fzsttsTtBFgtQHQ7+1WbI9dkAnQ4="
								"data: bryn (reminder)":         "inENzYtFSIiijOHiaw2PUzvQesc7gLbLHDOHUP7P4L4="
								"data: charlie (reminder)":      "2kyE3WQ1/V7qPTPSwJ2p34XLHf8owRTrcMttwUX6/oE="
								"schema: CUE (reminder)":        "vN4BYIXcnfRTLrAGO/WFWvTVGEkKxeCPfJ20aTfuHOs="
								"policy: CUE (too restrictive)": "AWATehtuQcWkfEJ0BfeMyXikaMcs+EJM5ucR8dX3JoI="
								"policy: CUE (correct)":         "1aqcMN9vZIRdQGc+WIyP1YMYeBpidhlPrN30qIWTaaA="
								"schema.proto":                  "GQ6Biy9SNCJbRz3D7VAveEfeJiGRAfSqdwYTIvXJ7qQ="
								"schema.json":                   "BqztGFTzGZgt+Ihm4LRlFe71LKfWeYpz21EM8BO7h8w="
								"policy.cue":                    "wiae8bPdsWK4i8Ev/Rf/98a2Ym7mfRFcdDM1eTp2GWA="
								"data.yml (broken)":             "SiZ9/mt1Bz5bKzj/0wA0iRawGCaoOhbIoPMCwlQrsMs="
								"data.yml (fixed)":              "sr+cJOdifPk9jsw1Cyj6EIz6V+YOTMU0xdn1FohC+qU="
							}
							code: {
								constraints: "bYBHFqtKX+X39ceLfn/5X7CHP+4m7EEh2icWGLjLHNk="
								definition:  "NQfb+f70mmsGaQupCBv3urq5qvuZysQ+Mdq64zjjbeI="
							}
							multi_step: {
								hash:       "TV9K7I9HIP35J7289366CH34BL7T2MSCC7G30G92J8L98E1FG17G===="
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
