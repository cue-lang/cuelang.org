package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "xALaDZ+e9Pjr5ya+JrpuqXk0essEhrVvrQjqffa1pNM="
								"data: bryn (broken)":           "5U7BsJUctHUpyolpPmokdEnXz0fAt1k3tK6+uHrAWYQ="
								"data: charlie":                 "pHXASgU66cGxQ0lXB8lOdGbAbdN+Db9FI+F5hp6fU/Y="
								"schema: CUE":                   "HWhRki1aFo5TAenMG2vCfl3rxoUN2VEAQmMWpHC2iIU="
								"data: bryn (fixed)":            "iZGwLc2Y3FeJHqW1graLcjc6cxjuxQyrd8+ADfTyAps="
								"data: alex (reminder)":         "wXCwAOxGeYuP0CIYuAUdJ403TTeA/b/n9L2BJCgWfpc="
								"data: bryn (reminder)":         "bq1546oEoW/jr1+jEIskXnCh/0MXZAEdPatlJ1PbE8o="
								"data: charlie (reminder)":      "/XLjJxbiN9ZfdkylFTI+E/w4wcpRKiMg2lPCHgWdijg="
								"schema: CUE (reminder)":        "EmB2NhOgF1PbEV4OaIEAwWg2q3PnwiB2g9mUz0DdoDg="
								"policy: CUE (too restrictive)": "J+1WCYiTT7FQDyLitQkhtig5mtGKjOXi1bMd5epPdNI="
								"policy: CUE (correct)":         "nqPXMDeJYB2BgkgtMZsC42wdmLON8yFsQ8+o8j8rUZw="
								"schema.proto":                  "3JodFIPPvHNcrEZAK8QObY2UftdM1I7jja06ueAYr9M="
								"schema.json":                   "Nx9uoW2A7v7HAnFxr+lvV1ZtJUU/ohyOK2TqKSd+OqM="
								"policy.cue":                    "yyMW/j85OC2A6eVwhXK2qiDOtBgUqzIdBje9qG+KH0U="
								"data.yml (broken)":             "WG/4tNkHPHjtdawdRJmdnZeAovKpuV7URas81K8dFV8="
								"data.yml (fixed)":              "ql3zHc26SCCnuvFk1tp2uyaOv+uPTZKOSGXY7n/B0FQ="
							}
							code: {
								constraints: "WV0OnqieHKjd9XqLbHt1ibFO+ZYLNSJZiBVCSEAHB4o="
								definition:  "vHwcp21RYF+utCR+zUet6F7hcDTWbnKvYbuzkP8dYjg="
							}
							multi_step: {
								hash:       "04RLGE2VDT2IRO4B895COVA31BM73S68IFE1G6UKNFRIU1H17A40===="
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
