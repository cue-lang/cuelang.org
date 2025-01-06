package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "XhVzJV4Ct95wxgSteyuUbWJz64PHZwWzhHSc0C8nu6Y="
								"data: bryn (broken)":           "pgwu9ed8mGtAxagxBOsc0+D4PCDMeODBRCKg4NHBB4k="
								"data: charlie":                 "5f8LYqN83lTPRbHoloOskzHveJWZStw7Ea/1NSsQLVk="
								"schema: CUE":                   "gg+YxEG3S9aeIKz/V0WrdpB7so3fLKayPGG3Tzzdo2Q="
								"data: bryn (fixed)":            "WgF3N59qw0Rvpphh1Rf0QKQkc1L0LENTYHzsNjspGdM="
								"data: alex (reminder)":         "l2ZwWhhetsWqESFybRJydq34kLcKoTivgLWFPxsCSnQ="
								"data: bryn (reminder)":         "bOtHrDrMs+qZcXBHW13RtuuaO4vI9Hj973ruboVvDWw="
								"data: charlie (reminder)":      "ck7Biu55lClHj8SNwcGzWvUAZmdp/iloyIMJKoNOtiI="
								"schema: CUE (reminder)":        "ZrWFRt0GV0BNDacqjE7ZBIfz6T92BY91Pup2hFL44IU="
								"policy: CUE (too restrictive)": "XBOvKjwI5YE1dwAmcPH6jS+od/cMcE6iYfR2WVnbTyM="
								"policy: CUE (correct)":         "Z7VQ274hR0pIiVYhsDyLe4a7tq3pLy/qp8/OGbDoKfA="
								"schema.proto":                  "GJh32miC42fnpoQc7QVTUC+nHHpQTUDBlJu5orEzpXE="
								"schema.json":                   "1f9FO9c04iCMnCe51KXTwYQJGeUV3fRWDJZaXtzd3eU="
								"policy.cue":                    "aqvAMPHlgXK/F7WDBfGGUD1T7c/u/wShwaRO3bYTrpM="
								"data.yml (broken)":             "m/S/U9k0JCYFFf4n6HoRpumrbED/4Hh8aJdpFMVX34Y="
								"data.yml (fixed)":              "aZk4l8hNIbAr66BmISP6VVCI4Wd7y949g6y0iiawD/w="
							}
							code: {
								constraints: "3N2Sq5rrrux7FbqIzfiglULF35wvxNJkCQEPDl8Tu9c="
								definition:  "gOkTN0/EVxSwNZCCSRBJKmLM27TujaXqeSub5JP+Gls="
							}
							multi_step: {
								hash:       "6KUR8TJI5V7BBRJMIHS8QO3KCHURFPCF0KJ40R6PPL2VAGAS35CG===="
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
