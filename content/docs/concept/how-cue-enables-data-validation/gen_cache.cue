package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "KES7eiZlnnNXIsD7Ivvr25OvLYPxfuJo+RDQ9QyXxns="
								"data: bryn (broken)":           "jz9OF5t2UMfNU3yma2H5aCr1Y748VScY0iekiA+nBws="
								"data: charlie":                 "7ooemAE1ofkJsldXuqBZwiysRj84BW46hBzB2u4IWYk="
								"schema: CUE":                   "VGvAslEV8ugYCMQ/pZTYjk7eRqR0Sd3FuTDmu9XaNLU="
								"data: bryn (fixed)":            "63wRlmrRUoVE6chB3rrwOoGlF2ZlWpVbxDDTjdB5JhU="
								"data: alex (reminder)":         "NdDaz1F4UVZqgd02FUWhEevMVUZn//fTu/0jk0J8U8U="
								"data: bryn (reminder)":         "u95HYMuuE7vZv9qAaxtosEHu+DLvLZ4KTserMZiAVM4="
								"data: charlie (reminder)":      "6EG0t2C9GH4PljsjqIUUkVDfOa84puMLV9kaBgTyCE0="
								"schema: CUE (reminder)":        "3Mv9h2QSmBvPMFzGynz0zgw5pL/Wve60idJrAF/TEj8="
								"policy: CUE (too restrictive)": "6YV4cX6Mqx50FcMrpXUMMGebWbVBUP2cBFXm54WHkow="
								"policy: CUE (correct)":         "SbaLgM2XiFJeIwi1zAjXlUA4K3kHpQgg+uvl9WD0fo8="
								"schema.proto":                  "RMz3gIcttLaPOTm36O0UbeXafk2oCX49y2z0diae5QM="
								"schema.json":                   "1JOwMzMp8J114MdySBSAxZx/j/kp5x5xwuY3TkCJ3A4="
								"policy.cue":                    "7BEmIjovtRWDN0Po79s67VzqfXV80sTPvCzuIeLq3Qw="
								"data.yml (broken)":             "n/CUk6tQXxLUJw1+h5TV86+Jkk7D00W8BhDr4GKgkME="
								"data.yml (fixed)":              "HQKOGT21nba2OKAjbwlYssYDMp6zuvUHJIlo9sNfj/8="
							}
							code: {
								constraints: "PAIZFsgGnYJQ//KguAuOXw7mP7dTinyy9EZw/o2FYdI="
								definition:  "nc/I0LHbjMCvvZNMzvIM+v5zatpLnG9mpVC8jjH1KyE="
							}
							multi_step: {
								hash:       "MV6BAFP1OL4AOKKPGTGQMBTQABCGIL5BHARQ92KP6T0P7PRB2BD0===="
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
