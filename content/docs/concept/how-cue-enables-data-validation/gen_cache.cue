package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "A7/Iui7ch9J3IxH+1rPoLkW7gzpNXDZ3yxIoTU0j3UA="
								"data: bryn (broken)":           "KegKhQvhe1az5lQAHRK1CZ92saoMXh2QHILkUqjlD0c="
								"data: charlie":                 "ZlS9A6GqTM4J7c7QMiKEjysVjjTVN36tOjRI1ez7SJI="
								"schema: CUE":                   "VosWLz0Tq4VDlvz7awmb1j0C/Tu0sH39wmPFqZPRDkE="
								"data: bryn (fixed)":            "MBr0ZKaYCgLGllh3MpAMH9dNaN+NhZmz6nK6/oSVvgc="
								"data: alex (reminder)":         "SNBp5sjnkoqIsaJueDlNW4ApsfrO5O1HsGjHs9K/SlA="
								"data: bryn (reminder)":         "1Q3011rvNn0jVbIjN+rtaTBgaf6kSKcvbswNHZctaFA="
								"data: charlie (reminder)":      "LMk6s3KSRr73GvhrlD+YSV0X/KBUMbfsowci5W2uB3o="
								"schema: CUE (reminder)":        "f+We47Tzvy5vTOKFC6T6NzA++Ybw/ljnQBQ6a2bTVv4="
								"policy: CUE (too restrictive)": "TmtYXv5i1cUFtyFdcBF2hN8PHcfYXv09EyR+aYs4j38="
								"policy: CUE (correct)":         "TMDbdbiTJt8EZNA4tqSu66EZoL0sb3DXiycajaBNcXw="
								"schema.proto":                  "VhfB1RsKDoh0TqEbpzXOz5RYZ1Xzg0z6jaPhcULbjNQ="
								"schema.json":                   "T9PnRL9J1K+8uQCsXzTljXLgRlrpNxQEQy9QdRXbZGc="
								"policy.cue":                    "lY2bYWGQ9aUXEIlSnuQtVGFlChW4DopvU+99tQNfpHY="
								"data.yml (broken)":             "GiQ3aMCmV6RIEvfg+BAXytuxx+VxW8hKVo3XYJJzCtc="
								"data.yml (fixed)":              "zErhH8XQKE5UljChIEZ9dgLxa1nPR+o4yA3sGrAZRqk="
							}
							code: {
								constraints: "uIXn/gCcF6c6GG9ORibrfKSqOgdg/3G3YCNNpj959k0="
								definition:  "2YMw2P4C4p5LRquQfqVcpnFrJJ7TUd3aQ+AUaCgLfSI="
							}
							multi_step: {
								hash:       "II21L71GBDKJ503RPKL2PK68OPSVICUA29U59FE5VDDTNI1D24D0===="
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
