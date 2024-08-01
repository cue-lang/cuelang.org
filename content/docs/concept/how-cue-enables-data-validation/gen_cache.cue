package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "YVlAvf1gSskapZvopJxZX473rJB0pey/y2i8+tZEpiU="
								"data: bryn (broken)":           "IL7KKgbGWqLBjjRt5y5YLk1AN3YMT4ad+JRCO4ni478="
								"data: charlie":                 "0uxvCjO8iOZ82H69H4nqk4Q6VOy1bDQV23C0dlg0kU4="
								"schema: CUE":                   "7QLGUJknHnttD5pJwZ5GqX1W4LN2/S343EbN4PRnviA="
								"data: bryn (fixed)":            "XIldVYM+cQj8SZxTMqEu0uwfAS/EzZscmTVgD2ptGC4="
								"data: alex (reminder)":         "TKfgedgKQ/DwKcHwRgErUX4I4BHiPM45Mi0XuIcNtSw="
								"data: bryn (reminder)":         "40cftophbOYl6TeVZPMNl8aWSBwbkVjxXMMBEoeaQC4="
								"data: charlie (reminder)":      "0DVURDgswZaarAwnL6nIhYrLWMtwbWEwqYnsyMpAB2g="
								"schema: CUE (reminder)":        "7rPL7w29SCtBK3ELGvpYd1ave6RM+52bBQEQi5p9+X8="
								"policy: CUE (too restrictive)": "B1FG+pqJMoKSQlsuUzf90rqpwr08oK95rdmLktnQaKc="
								"policy: CUE (correct)":         "zUD4x/Uc1InmzOuPlRIukpdcXb7MEZsJqphysSRd2/w="
								"schema.proto":                  "J6NheH1U0DJPRvwnzpzcV6QYLULjKk5rh2gTepc5/Ws="
								"schema.json":                   "tr4HWtmi1WvooL+S4eAGraOpOp3KsVUHNliws7ffQMw="
								"policy.cue":                    "kQJ4TYdUlGC/v0+1s/C1IuAY6gSXE+jEgYmwy+MKwzU="
								"data.yml (broken)":             "RKBa4r0HKAdmJyuVbkhW9jg85G66/SWjVqGY9hkg/js="
								"data.yml (fixed)":              "Jy4nnOGZirzGF6N5iNXUSS9qtn/nqG1yIN4NgOcWg5Q="
							}
							code: {
								constraints: "FpmpHP3noI7IyXWzZHlUrTV8RNAsAFNAou3kNpi1m9s="
								definition:  "Naa3vtfz1sckibVcBrHEDDJA49mD1x6pZGpkTackg4s="
							}
							multi_step: {
								hash:       "8QRJGC7UEH5799BBJM9C8H84FDTD1EFI9F6FG57PGE1AGHCL8EFG===="
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
