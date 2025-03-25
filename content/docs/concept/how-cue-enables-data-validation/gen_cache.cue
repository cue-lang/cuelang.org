package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "iQW9tvElF3ul/KWI9xZmTCSPdLC837CVYXNW6bGwUhg="
								"data: bryn (broken)":           "O3Nxl9sU4DOoilYfuoThanyvpQjojHrioPmxYuDSGOQ="
								"data: charlie":                 "FblGmlO/anEgtuXpuSU9GIdxKx0pGE1x67uNHGxjew4="
								"schema: CUE":                   "KwHcDfFyrTZLBdhyA4V2I/MpNn3pvANMTi6gKORPeo8="
								"data: bryn (fixed)":            "PNfjb4Z/VaZ6bQ33SZE3TfZ9YwlZgF1r1pahZiFS0EU="
								"data: alex (reminder)":         "aZUUafhG/ZOHOO0koD26pwGT/94nN4jNWUcqWPvYD3o="
								"data: bryn (reminder)":         "cPUlGi1KxRR9UHInla2atqsIzk5ZxmSFcFnBoq/bWMU="
								"data: charlie (reminder)":      "qGYxknuWi4WophlRTyrmWLjgY721+EAbMcCTSMK+k2I="
								"schema: CUE (reminder)":        "KKBSMBS1ME2EwoGUAfxc0PHK9/UKYxmMebSE6AvfAXY="
								"policy: CUE (too restrictive)": "yhlotVw0PdNyGUVAfxK+Tfalb3AqLsiSw3Es+nDtxHk="
								"policy: CUE (correct)":         "47JDlUm9PJ6KHDjGBQYZmstyBnzPnUZlBKKc29YGgKc="
								"schema.proto":                  "bhAk1UlFowT9QidLWVECzclgJVFCNcIj5Uh1WkvYKa8="
								"schema.json":                   "yI0/NpLNULQcek0zeQnBK181OqthGDQdFa/a6hsUv1o="
								"policy.cue":                    "EcMLMtEZ5X4uEVuEKnvWhnpQQaTfwJFbmDDzifH0htg="
								"data.yml (broken)":             "QOHth+N2WbJBeQQXmgTr8FGJE8S2XKdygL7qlYXjg+I="
								"data.yml (fixed)":              "b5f9f2ZsGnSJGAf1ousE3D56p2CgzZ9Yp8NmhXu+Wlo="
							}
							code: {
								constraints: "LCI8m3PSfPutLCxt5Rz3oUXYOjkZd64p6INGsxbEu0I="
								definition:  "L+43OmxcAoAgVIePGlcOipluKoDhZgfOZPlFjH9Hl5M="
							}
							multi_step: {
								hash:       "AFA5J8T150HCD1UG15I4Q7LIRLMCLCNGE5DPH8I5D9A5O2LILNCG===="
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
