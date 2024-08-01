package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "CpVEt+H7NtZsCjZmwXKDxad//rqhy2RtCvc7obssMG4="
								"data: bryn (broken)":           "N1Ww4QVCl/TAbNTA2rjH7VzVKkcZkkUKKVw+yVGenMA="
								"data: charlie":                 "kHYVaAkAUad4ORij/5XoF99TklOXncV+e4/rqvzxQpk="
								"schema: CUE":                   "Qv0GK/h3LNX0jLzmkIHsubVhLiq+leCy0lTyTswLIk8="
								"data: bryn (fixed)":            "ZjSjMXcANZnIOb5zxQJuRV9Yr2qKeIY+n+VfLSEWg0Y="
								"data: alex (reminder)":         "SjLkD4gadU3BaIaG9kCpkjnjBOFs586wXapt0tsHyZM="
								"data: bryn (reminder)":         "99sp+57nLwTGGzKCrsjOiQibaGjt5w9t8QWihjMBN+M="
								"data: charlie (reminder)":      "DrmcDXRerYg67sNCp+gly3YDj2Uy2jWozgJ3eisWqZA="
								"schema: CUE (reminder)":        "R+1aJs8E9JI5dssOq1/rEpptC+Zs2gOyGqud1nhxaZs="
								"policy: CUE (too restrictive)": "Rvsentn5YJavTMm8ZwmalG3Aj+mqeKafMuR2FxSV168="
								"policy: CUE (correct)":         "VuJu6rNyUoWAO3Suu4gsogI3PSzeRpknYlJR10rE/7M="
								"schema.proto":                  "osFa0CqwtV1LuqRXkJ0/BpY3zbOMndvmUVbmoo8El60="
								"schema.json":                   "RyDwt6UljLzMpOW6dfF753Ox6xeaf+1rCh8I/BLNGps="
								"policy.cue":                    "FR+cX/FMd1InAlmcKc1gj9nQL8xLtdiYZWqtSmmIMp8="
								"data.yml (broken)":             "DXoCCnL9Q8xNxTdzCBkB1LtbWaCR6sdKB44mLypiMrA="
								"data.yml (fixed)":              "jkasQEuncP4C2oqKZfwJTUmNBRTzdAErqJOAVqpUZ2Y="
							}
							code: {
								constraints: "soxTZyzel9lljfT8my9jlnGe/E/HqUrtZxJDOOLS92A="
								definition:  "yKPUAsONwfSvFxgOcGLNxIotuLh9klVcLA3tLN3r+Xg="
							}
							multi_step: {
								hash:       "I70FS2IHG31AVGSREM58Q07UGRDOT4DB1K6DCVNE6VR14BSFGSMG===="
								scriptHash: "3UTP5PNA8DAN79NI2608LE566NUGOT51A65SSH4PNGVB9HCPNDB0===="
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
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:21
											    ./schema.proto:2:3
											anInt: invalid value 5 (out of bound >99.0):
											    ./policy.cue:9:10
											    ./data.yml:2:8
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
