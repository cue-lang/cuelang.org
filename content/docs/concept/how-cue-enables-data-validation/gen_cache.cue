package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "MDibNrlv85PUiI4NgV+yazAwBczXFHZZPKyeb8lZBI8="
								"data: bryn (broken)":           "VIgfqYQ2Bbd04zuXBqM+Xs95fhrHBIiDjHRCRVRo+uA="
								"data: charlie":                 "r41ESKPel0tT56AGF7Yu8Seag0OJhB6QIdau8bxxDMQ="
								"schema: CUE":                   "cWgy2/S6X3BIUEEL9mlwqlClPCQO9lNb1m4romrPGyQ="
								"data: bryn (fixed)":            "1wFXmC30sWLeBy4JSUGYD3YjAwAfXA/IGQpM355dZX4="
								"data: alex (reminder)":         "60J02kSR9SUA5p+hQdTze1TxGgfA+kNEPvwzjRrP40o="
								"data: bryn (reminder)":         "kV0nKFpmCh/9FIV1qzmDr19FXqGzqU3YGezHmTUF+Oo="
								"data: charlie (reminder)":      "IWubVcGp088GuYvF3ZaUicpnDfaDbw8dZFLQDjbj7XA="
								"schema: CUE (reminder)":        "FCTEzp5R5r5O0TLIOxr6CARaMyRmcuTTdANJ8YGFEZA="
								"policy: CUE (too restrictive)": "+igp2MiZjZuOz1r7TjMCNqaS312qsYyEULOZoAmsIOo="
								"policy: CUE (correct)":         "Mk4fauf20cZ4mBfS0gWpqWFyg1w6PcxU2tZ+WYltsHE="
								"schema.proto":                  "rbg9Hc9IRIg97LiC5QQgWAUA0EqcDle2zgv5+lAK4cw="
								"schema.json":                   "3YUCCLc41g8KD75x2gZ6w6Mbt35hAd6y3oTbl9GNMdc="
								"policy.cue":                    "J1A6wgG3lgR3VoO/4+C1vjENN6hKxqI7WGo3IWBYO6U="
								"data.yml (broken)":             "Bk5EJOoRuGqwC6gGNMG0kcQzcW1H7LjEyQAjSsff2vY="
								"data.yml (fixed)":              "hCOF19pLhrp9Gvaf0mU2Dg0BjNAKum1QOjtrG3K7Qbs="
							}
							code: {
								constraints: "t+hLCeDu0bSZdHVXzD7dRDehIyJgXmbb6iyvVH3J2IU="
								definition:  "eMnKZcZZJJVvOLKsyghxx8Vv5YvDgIOqf8ky3WOcbUE="
							}
							multi_step: {
								hash:       "I1G8F4B8ESKJC13432L1LGANVUUCER3IBJVVV62J9AAEH7QBL960===="
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
