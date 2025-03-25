package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "RPm6zN8UssW5IlnOSp6BV5shaPnKkWtW4i4fuMrarTU="
								"data: bryn (broken)":           "1WkSHQCMXdQG3eXG9Zz2z332W+wv3MZxzKOYmUvJ9rg="
								"data: charlie":                 "6fVYgfj1rmwFM9pRxCTJalrXQVSXrZuqRcC6DGKXC1E="
								"schema: CUE":                   "MgAxeIlTwjerMMGxyObQvhpEEidX9G5I+HO5Jg9bTk8="
								"data: bryn (fixed)":            "UWg20yOab5e3mDsZnGKzh7lNiTe8xR+CzP23G78N6ZY="
								"data: alex (reminder)":         "Slqju/meDP5anoruUOD3vCunxKCtPIGZKfSzZzMB7H4="
								"data: bryn (reminder)":         "v1NWctgop0QQHlYx1qf+LJ+jy0SStTbj0SUtstv5+LA="
								"data: charlie (reminder)":      "ioK6cxCZi/VOASIE7E7dm4sWFGH1wbss0+7UOfbyapw="
								"schema: CUE (reminder)":        "OdZCfSheHHV24zeUngY5ZUf/Z11hPWu/MH1l3c2GVJQ="
								"policy: CUE (too restrictive)": "HYL9d9pHl87klxjDm/ygQrglOX8I25Ww0uBLhrE34+Q="
								"policy: CUE (correct)":         "tJoISdsM6OXT/PFDX9q8V7a+uiDWn92oDYOvRoUyO+s="
								"schema.proto":                  "OlJQLLb5OpyHnOpqFIhyiKdt74m2bWeSWmoRRoiZ6mY="
								"schema.json":                   "LD/dfLLhbhhdS24X9y2kJHpu+qO16f6KshUOkLNGoTY="
								"policy.cue":                    "wtDzcfq6lxzXUvqtWcQh9Ii9y4uaY8qtOJhzukFKNuU="
								"data.yml (broken)":             "bBKzuYF2CoxfMaz3eMin3fN40OREl54dEpHe3Djjbuk="
								"data.yml (fixed)":              "R0BJnRwBPwQxAvnkT47ir/CAhqRWXUwA2NkhL7ge9Lc="
							}
							code: {
								constraints: "YBPHyaxfBMoWgIeetOmt/4IR9i9tctoriaBaV87dENk="
								definition:  "vZsxI3x7LxJIG0CRYqCbdftn+5tHy2anruSZrp0fLFw="
							}
							multi_step: {
								hash:       "T24QNHFELBK2N4CTON7EPKJDCE84G7F09D38KAMIE1MB77C6SJJG===="
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
