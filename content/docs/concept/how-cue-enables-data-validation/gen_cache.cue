package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Qw92C/VpoJFUxM7LVpQ+5NMBzeefZ+ZOXlK1dSSuE3M="
								"data: bryn (broken)":           "otfRM/sc7r937v9f8BgWZZl/T4i1zN5GQPrkmUmaK5E="
								"data: charlie":                 "8MRP/2pf8rwgzji3N8pLRSLoKwe5/TfVtYYQ5FFhtuc="
								"schema: CUE":                   "5/9QTo1ORwZf0QS11CnlQ3jft059V1DrxcDQt1OBUOY="
								"data: bryn (fixed)":            "RUTZFMfuhTiFmH7/onrJTZ6JiRxfOieNUyNhlPXIaJU="
								"data: alex (reminder)":         "sBW8nKRaCVXNkPkSOUEJ14X5Sv67wsFLpT4JBVPUXH4="
								"data: bryn (reminder)":         "CD1FLnVUB9lgFOEV8lJtFCfEuCkVPKrG3FezELnTKhk="
								"data: charlie (reminder)":      "HHbaUh363LGwIX9Hn0N2tkiQaVAPKrOq/kxAYnF0wu0="
								"schema: CUE (reminder)":        "7DWVGD/zyey92//7Fla7dP2haANyYMpeCWoDuWN6ZjY="
								"policy: CUE (too restrictive)": "yiTRbisWNCtaLzaLJHR6XfM7cdrk4YKXMnilSsDT8iQ="
								"policy: CUE (correct)":         "E9D1jDEZ9Jy/wpZ0QCxLEF0Uxt3q9dXDK1Z/OAOLDKs="
								"schema.proto":                  "JtjkO9v5wT0MfLZa52qKvlDCxQpOcjPaEoVuyxmSM08="
								"schema.json":                   "bzQtvl3O8dZKkPvBvqCbNjuRfjY9PoWrFapRDqfbQus="
								"policy.cue":                    "xwyQ7750QqH8e/Sg3g4NhPdsi3YZxluAef03Y0PzP18="
								"data.yml (broken)":             "fNUm/5cA1t4PgRk2k5uFpHh5sPcORRpbTxztmQkQR0g="
								"data.yml (fixed)":              "lZjpe6BRSrUHk8ejd5IJZyJS71VUvaao8t8obDv8YT4="
							}
							code: {
								constraints: "EF30+Qkxq02k70zPleGwXLlpepEH4PA1Ph9XkxmoWMY="
								definition:  "s+esLJ4HqCf0D3xVACDnTrPF2jdLeS6j2PkRNLmcDjQ="
							}
							multi_step: {
								hash:       "ATM81GAJB3N50SN8R49DBL3HONCAIH53L86L0S41AOFF939QM08G===="
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
