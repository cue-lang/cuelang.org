package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "CmAzM+f8WMGM3H0W15Fl8DFbKvSq5rgEgbKwnWE5yPs="
								"data: bryn (broken)":           "q3MoyBa6J3cF7vdAFfCYjEFNETQnco1GYhWbSV76Nv4="
								"data: charlie":                 "taOEJexYPD0EpcaCjksjJXH4YA1Z/ebh87BuQ63pBWc="
								"schema: CUE":                   "YHDNtCswfOsIbAQh7rrZUWUzJ8WCMGS1bckyxcjkuBQ="
								"data: bryn (fixed)":            "by16XgfMzn5RsuoXMp4o7DuifHmJNyzAUHubsHAm8zE="
								"data: alex (reminder)":         "PmQnZLcx+tPMUGZbgnbdK+YKJAEE78JIEjREc5zQcjA="
								"data: bryn (reminder)":         "g7Ep5ebVgw56PuWShqEA02UB2xy3MXr2F96IO+hQudk="
								"data: charlie (reminder)":      "OmQhGvWod19/KRX2R5alztjmbTqXp8GL/YtnqMuyE2I="
								"schema: CUE (reminder)":        "AxGmZ/9li3JPmDryVR86E7A8e44/6YFc7ZHoBQayLaU="
								"policy: CUE (too restrictive)": "DAtW/DOB0CPcZMFOyL7WRUBB7c3ye4EGojws+hUJKu0="
								"policy: CUE (correct)":         "bk1A347Rb43JTP4qiAcOGcl5yUmDYtS3r8gZ1oyw1bY="
								"schema.proto":                  "BWOGGxf5XGwBuIN/TrInVOKk7+eFprNYVlptXfqxsDU="
								"schema.json":                   "m2s4vcfWupJ51M2nMOCUOZPa9+4ggGA+AP5jdZp/YUM="
								"policy.cue":                    "ZvScybIhoItAqKM0//aP3V3yOY8XU6Zt/hJQyTutuRo="
								"data.yml (broken)":             "vZb0WuE9ufL+PJyrDvBizYkzyajWo0DK3XSglsyBYgc="
								"data.yml (fixed)":              "WKzTKLEHo9XqyIoqbvPgVeRfkI9pGPtr0WCh7tpZcOE="
							}
							code: {
								constraints: "JpuHcW0JUi5jlRLkxWdFNglZTZrjscT1dL7fleL0ORg="
								definition:  "GwRVrpAQ4qxJY0w6aTcJv/qxiaf3w8kXLSOfT0qoly8="
							}
							multi_step: {
								hash:       "SVUJ1VP4AKVLDIL8LNHMB87T9HUDRFRNNFLEFPBFUO6C2EOHUO80===="
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
