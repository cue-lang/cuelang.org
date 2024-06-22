package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "w3GRQknm8wlh9p8nsQnjFnyN6Lcl6EbE37FYgiE0Yo4="
								"data: bryn (broken)":           "RT5N/m27Tx1muDwCJ8DNzUAACfUbEkEb6GAtxDgQPL4="
								"data: charlie":                 "db3HK4rRG2excI66ZdOfrMW/NkHPr47ApJgrsLIHLP0="
								"schema: CUE":                   "BFnteZVNKu/6fL+FGtNW/nK3l8jdczcfCRaQ4ZLxOB4="
								"data: bryn (fixed)":            "WXJxQTsYPftK2cGyOB4NoeZrg2kt/JDvBnOfYL89MFs="
								"data: alex (reminder)":         "ZuQf6D+LqaKzmLjpXcdgmCsgfrfpN7U6CVX+cccqL3U="
								"data: bryn (reminder)":         "WX450kIYzs+MVCNcyhfeocsF8MAZ1HC+gSfbDGOyQIk="
								"data: charlie (reminder)":      "iOxufDSgYYY4Gj3u4ejJ1xxupfwekff0r0uWm18ArEM="
								"schema: CUE (reminder)":        "ajyfCHG3gtiqgvZ+1Q+foOiVsD7OXpj/Q1YOiCB8c7Y="
								"policy: CUE (too restrictive)": "u8MSvZsgG+OBOg5TXFQ4/4NyiT6DpZXHeVuyY9sA030="
								"policy: CUE (correct)":         "vABNsmYkYBG69LBDk3Z//F5A1Rfb1XmmYx2VUkun1FQ="
								"schema.proto":                  "ag1vogVanGgUJKtdsXOdm5OQq2eDUHbZEMzwusEtmFc="
								"schema.json":                   "V0+TDwYutDEdcGUHjjEnkMHjDTrkWeh51vW1vdmmlgU="
								"policy.cue":                    "7wfGBvBJVHbev7xxtJUG6JgFWsQOnaTxsPV8HH475A4="
								"data.yml (broken)":             "tGcRwcbmS6olngCMY/A7QxsB8sJDXCWl352WwsALEqU="
								"data.yml (fixed)":              "XCAR7QYYREHI/hYf0hbbyFTawGQfUNTpTggtEC9OMRY="
							}
							code: {
								constraints: "psdSwAdKiMjJkGKz4ywkzGyYmrbqbLWZJ0V58on4k0Y="
								definition:  "fWeSDy7suczZKR3ItDlZTnHVUJIHrC+7wB+pwXlol9M="
							}
							multi_step: {
								hash:       "CAJIH6AU187H1TIQQUFFV5A21LJKQDCF7B4F5USNAC56IE77OR3G===="
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
