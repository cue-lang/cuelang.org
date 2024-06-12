package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "AnzO57MReiY1ZLEPzDJtNVfUnvNkeac6a9BaJKhNO48="
								"data: bryn (broken)":           "bNYlNmH8sMqRAmAjuIkLxa8Hz8kULDmQJx40IOth4nM="
								"data: charlie":                 "qpkYAcy2Rg6E91jy46DzSIjmt0FkOEFKkSwoJtwMHeo="
								"schema: CUE":                   "QkQ3l78THFodUTPYOvVthS0QdLdv7yQxyRymYmelhAk="
								"data: bryn (fixed)":            "/bFKc3BvsUGrotEzPKgXHeKZIWWbQBVISPnoTqq7/xw="
								"data: alex (reminder)":         "ewrwdoFp9GwQDAkpFBTFK1c9B1GQtAeZWdTMjs3IOA0="
								"data: bryn (reminder)":         "/w+EE0naoHMINJDU+wiSgI2FseKTedxIvN8TqY84kek="
								"data: charlie (reminder)":      "SeKwXpeFBauF/rAs8Sr5eOy8o17N7wm9QT9TU2cni/E="
								"schema: CUE (reminder)":        "4UJTxADYJXrghUyjSCWy+765ycTBt1ilNIQcCXhJiJM="
								"policy: CUE (too restrictive)": "ahfyj22uwq8eb2zXkzOVGECFRRg6xpLuhE/ie2mShks="
								"policy: CUE (correct)":         "6wItWoBX7/gEWnVbkkBQbpGPpUhAKZpIxdwKwC4CpBk="
								"schema.proto":                  "0Z7+4dpLMmJpNWBQ3Tg4cfkn0bQ3yMng22TebnnlkTs="
								"schema.json":                   "GpUXeQRXDZfgLEPLd0Dxk/MNB//U8+KzCxltlLmR1Ls="
								"policy.cue":                    "4bb3lM83tk/2+uFSuliVJlP0gJxn4fIxqGbif/1cZdM="
								"data.yml (broken)":             "9sCgJcowpju5nTGENXgEVl7Cej33uAdHc64CoB7+p0M="
								"data.yml (fixed)":              "onYlrRd7LM2ogQ1oqUmoW8ZHRWNKDoO0E99Ii2+XwDU="
							}
							code: {
								constraints: "lRObhL/oqBKT9TpIbfk/cJ9e58QSx3YBWFU3cXKy9Zg="
								definition:  "OCf0viqQt6EX1mZh2KBXdLgYTHXkk/XCiM9FkmyCZqA="
							}
							multi_step: {
								hash:       "BUHHHLDP4FFK4SSSGM67QB5PCMG64KP4MLV4MHEKNSADUB4QKIVG===="
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
