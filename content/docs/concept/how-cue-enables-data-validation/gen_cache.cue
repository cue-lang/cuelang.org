package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "+0Fn5ZGqtq5zaeJ4bMav6pMgYb+V5PKgprZRo4Y+vo0="
								"data: bryn (broken)":           "1+Eqb11g/vGIYtwYh0T6zUkou/JPbLshV+U2ult7C7E="
								"data: charlie":                 "rPyPgiMs+DqixU34OcFNlOUexZ5mn52PmxsPc3ShTQ0="
								"schema: CUE":                   "jgWjIlDyz8WiY9OXUYdzsvZmq5O9n5HH6IySPaYLhK4="
								"data: bryn (fixed)":            "ifOabXaITkIy4FaNa/UAwXtAZpZPO3XupnPH6MaJKWs="
								"data: alex (reminder)":         "IsYHDU3L1HeL4FYBWY6ODNKhjdO7SPz5+c9wUHvixK0="
								"data: bryn (reminder)":         "+h74GgX8tnLUEsNhki9ggc+1YgN6Bjcy5VXX5pVqQcU="
								"data: charlie (reminder)":      "+puyRfi1MNZBbVYFpGCU72yFz4iIcNX2Zo6GSHJPGaY="
								"schema: CUE (reminder)":        "EuApvm7HLC71E/tdIW8k4vGDoAJk2rwj7+30SLThms0="
								"policy: CUE (too restrictive)": "fez2bBO8yHXxqjtwFdmGoI8ac8tixzXslTS21CZT1W4="
								"policy: CUE (correct)":         "NcKeAygkaz2VYPZtcF3U3cu2Ex9FwWCEwRIVXytVr8M="
								"schema.proto":                  "eKuQJB2QfevWFP4s7OyZFJhSW8GdI+A1Mab8GomcTx0="
								"schema.json":                   "tYq793oxcPrfxF7Ix0sPOo4QRUHjoONE2oue8jcUDuY="
								"policy.cue":                    "Qn9vTQmPUS8nHiw0pnzJMGNVY3a6pnyTvYdfwU2mRsA="
								"data.yml (broken)":             "2s+xKScysJXPl7NgPVpKLZwI767VoCLgMXfPm0r/VRE="
								"data.yml (fixed)":              "+tcZRzI6epo7jhNHjfcywjBGkA36zw0K3tFI/R7t7qE="
							}
							code: {
								constraints: "tNu9qQzkuMLjxANrWMAazEmJtfX/AqI2ZBrzijHZK4A="
								definition:  "/ry2/wwB82XqLWVp8joTgQAubhvBiq4Deh8Wo1KFOJw="
							}
							multi_step: {
								hash:       "FIKOUHVJ7VBVNIFI8LDPSKSVOT5IQM68V7EJQ2QQ8OVFH2M7I54G===="
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
