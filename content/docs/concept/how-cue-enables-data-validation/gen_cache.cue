package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "R60IKVHKT8Mh/q9i/xP+Cr+0Eu4Vd/L36PGvdesGKHE="
								"data: bryn (broken)":           "6UZHGk292gBMrf0wo3/ZOV/S/qbnwDmEWSagw53vQ4I="
								"data: charlie":                 "YvEtWyMK3rDOPBxtnVwqn+2G8xGr3F7zWPAUFhGaTsc="
								"schema: CUE":                   "fMYKvu5muDTNwyDUeR75Tyh2SiS+8G3xv7moVi6EyZg="
								"data: bryn (fixed)":            "EX002jCelEj2Em3FKb6B25ro6RCUbHAbP0Fi7vPltbs="
								"data: alex (reminder)":         "7lt+JZMuSZ/P97Aj/zBw0c6SFRMl0ZTpJpNypk2vfwY="
								"data: bryn (reminder)":         "whuMPxlIxOeurxuWuk6dNJQ81neG/QSVUwQy1widblg="
								"data: charlie (reminder)":      "Lel7LfgNbDco6UU5F1Q+eul0QUn4pAe0S/raTVFkWRs="
								"schema: CUE (reminder)":        "WWfuH3ZIJ9oRGOyEo4m8JKBZWFalB8rN2yXLMxtVzh0="
								"policy: CUE (too restrictive)": "XBAsVEB2Us2Ea9fVN7fZxlw2RL6PXRBgAc6NAwOXuM4="
								"policy: CUE (correct)":         "0w84xHQzMwGWYHyk25Nw8ha5VWik6Zekx9U4P+3otD4="
								"schema.proto":                  "NmhEgJkqXfxg0K75MZ3oELiXWMNYo+7Qtf7R1RxGQTU="
								"schema.json":                   "ktiGbl5x0zsuus3/0TezvLld1JqbYttjm1DfbDiJLYc="
								"policy.cue":                    "pGtUuh2rx70kTXt1sPvT3TQ+OSYP7IJKjMUayWsBYLk="
								"data.yml (broken)":             "rsIO3wo1v4pRUshby8T9KE8EIDcAIDx3PAvPlVet/Ts="
								"data.yml (fixed)":              "ELVBdxBdzTj1kUEdqkrtYcAtYpfIpgl39fDm6tFeMrc="
							}
							code: {
								constraints: "e0PUZbFpcoZdSvGRH8gjlZkYyWzfubDsoJuSbd5bsLM="
								definition:  "Al9fSFz+cFSPPyM7vK6/1vc7MkhkTmjxRjrKVOKotQw="
							}
							multi_step: {
								hash:       "SG6EABEI2O07OHFDUKJC6OHCHTI3LIQ0LAL4R81B3Q9IR96SLT20===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
											    ./policy.cue:9:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
