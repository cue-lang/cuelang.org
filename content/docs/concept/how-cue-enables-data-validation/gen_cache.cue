package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "T07T5KrATVd6q/3K2tnNU6aOQp6rPeCJKEZIWU010xM="
								"data: bryn (broken)":           "QdevPHFvcaH0rz+s+NCgTYZyhgLAOHGFKKmOOWZzRxk="
								"data: charlie":                 "yyruQELxBjc2yV6mag3qAsy72i+tnnyHkMRjvRfr3ro="
								"schema: CUE":                   "1yv/wDqXYAtTX6eHBnWi7sFVP7Pl4erLAYGRRNhMYmo="
								"data: bryn (fixed)":            "7tFfyVZqEkJ9+7bbXae0NB0vK5s3meLRws4D9oUUEyQ="
								"data: alex (reminder)":         "TM9/ClNRgAraFCfjMc8cPnaOKdlOjhvTZwrQDOJvN9s="
								"data: bryn (reminder)":         "ln7i9iCYL9GNvgKic2hT4hfeb7K+DSTPN+Sc5267gUc="
								"data: charlie (reminder)":      "0BoHvwr360nySqZy1/QX3Lqc+rzeN5GoMgtNouelDv0="
								"schema: CUE (reminder)":        "s03vpmmq8Nj24uPHivab1MgCyKLJurSfu/fnJTyUEPA="
								"policy: CUE (too restrictive)": "3Q7Dr8pe3TYUFWQt5LZgwJI90RtGuWZ1HKCn9gFjNQU="
								"policy: CUE (correct)":         "csaht++oZ5p78kuVfU/G/ZwkP+qbik/8B1yEt4BRRD4="
								"schema.proto":                  "IO81s19VuzZWFJBUMOgg5V9WSjTRms3xFd0tm7vRhRo="
								"schema.json":                   "faMOE9idUlozbCn50E43VCOEO04rMlQ9BDJSi4fPJRE="
								"policy.cue":                    "uOVttBLMBB2vzqRp+W+z+Kpxx3PRLpKOamE3JenbYeo="
								"data.yml (broken)":             "hALGfOTnawjAx8hmZiufPUyoIISwTo1nu94eajymvQE="
								"data.yml (fixed)":              "+4mDXHW2U2On2hMbqBL9KkDW1F+/5MMFcZdQlbqqLz8="
							}
							code: {
								constraints: "YpGqhAyKfSZEg2ysbHPwBwLtC6EUh0Be36A3en+fDMM="
								definition:  "/BIs7352PDHI4VWNZR+2X1HoYuTUaPDuIiizC0h8cT0="
							}
							multi_step: {
								hash:       "8LBUDCIMRJCI9LBT1FHLKQ6J77RV387ISVEO7C7OSO3CRHEUHMTG===="
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
