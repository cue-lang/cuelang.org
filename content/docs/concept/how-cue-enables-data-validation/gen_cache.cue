package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "mgfLXSzzsmDwP/3WTzwYGgSuiaIF08gU/bDmmf9Dh0w="
								"data: bryn (broken)":           "vPv/GP6EmAZFZIkT0oX8HYTeZP171O6LpjEJMaGjd7s="
								"data: charlie":                 "BL36R6g/YRTnjoqOtYKXck//ngJv/0T1U3efVyh1AfU="
								"schema: CUE":                   "vGkVj8LETJTeC0GuxDS0ZiqnXl5784HmzZ11PBx1ZRI="
								"data: bryn (fixed)":            "FbAv/O1oLaV9OLs36cVgHPLMAlwwLsMM0W0DY3PJVTU="
								"data: alex (reminder)":         "d+SNKBzezVcXatyPqj0QLdNhNX7bbMWmch+pcTwU7QQ="
								"data: bryn (reminder)":         "h8NkXUsblHuyIUXx1VrTFZ8lc+kTiI4PL3Lcp4R7fVk="
								"data: charlie (reminder)":      "pHNxKC7fmVw0zLoRRmUQWACQ0NHzeB6AoVi3D0UkKZ4="
								"schema: CUE (reminder)":        "mJR9KYTJe2rREnbsIaFipEVYUWfZqHypyfKiIOTBpo0="
								"policy: CUE (too restrictive)": "FdV5O/+ABrxNWi1krdO3yp77x1cc/6gvYB1VLBGHSnI="
								"policy: CUE (correct)":         "09vDU0A6tbiqnrGdf8OTS8VPfjqSI7x0WhWmMTi4geo="
								"schema.proto":                  "gN1jh4T0vzKYT4IwykHjn5nqrMIYrlc6o9pwZG2dQRE="
								"schema.json":                   "LZrI0dxSMw19/CKpcM0w/U92Gh1BoPPFFD8Br8teleE="
								"policy.cue":                    "AkIBFWtVyKJfL0M6v//lEdRDVIs60cNHhoIPOc8qSws="
								"data.yml (broken)":             "294NTXMPp+3y2ZFdOBGvxB6wFWB4SqJjvsxIUqxaFXM="
								"data.yml (fixed)":              "tZD2DtojEJvEF2SK/uUWgbUu69X4RbXT9BPn7uLZjIQ="
							}
							code: {
								constraints: "g6YvrxSDAGRU9bx77pT0AU3GM0lzGfxcrUDoOsn0S/w="
								definition:  "/h3ODoxFiIN4oP7Q++VJ+oR5tkf6jHLbb8HT4bmDHWw="
							}
							multi_step: {
								hash:       "R7P3OTRRRN6V9AIISUCRN7CR9N6H18NRK7GG4HTUH3H4HOB7LQH0===="
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
