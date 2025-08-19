package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Q2VYP+6y/BK0djTt2pVFAujYzaqI/0TfVWWf9q3JPn4="
								"data: bryn (broken)":           "OK5Y66l9zjLqzCA5soWWR7E4jXRv2a37kCS+fziWEdE="
								"data: charlie":                 "PBlptRJgKKZGebczNJqEiQ3c6q5vWvtydZfTTkVJXiE="
								"schema: CUE":                   "nfbDWzGIBKjQXe8gtdXfk7c+SfVO+5NRW/m/KZD268Q="
								"data: bryn (fixed)":            "xdTZRXgSfHINkmY40Tag3zO1B0ahudIQzG7IANrAoOs="
								"data: alex (reminder)":         "3Sti0rOmgug6rPq3XQdxPKfHlRVapuUm7Y3RK/I0K3k="
								"data: bryn (reminder)":         "PbXFfKveG083M6haEROtplI3PmXajqHD5mPABMhuNzM="
								"data: charlie (reminder)":      "WSZ307iNhOtiYXf+FaZhpKelAO+5YhwKjbHD8Vqe6Vg="
								"schema: CUE (reminder)":        "i/gOlxgMwp8aB5s47C/9j6OrAcWjuAAh2MuwzcrjKgs="
								"policy: CUE (too restrictive)": "snmdaw/daOiTqAcG6yTDCDUcEEEh+VT4EGaoAg83x/4="
								"policy: CUE (correct)":         "yi9Jap0WjL0QyNhFEpahyU7TDZnWm+VJvC1s6/tak1o="
								"schema.proto":                  "LJqa8bblkxzJAJKzOaQEklqnpt6llXwUiyEwqRN74F8="
								"schema.json":                   "MKUdWGY/bC0MXmGTa/1Su2rtpGnToonYWCoc8ivJSZg="
								"policy.cue":                    "EWktSBIpjPykLVd/kak+c9TWRGcDsTdAwJYbYLICay0="
								"data.yml (broken)":             "YJweS/925r9SVzT8upawzYmNYvNeZVOnTVezFZF0eVI="
								"data.yml (fixed)":              "Qa9mOMkfTCfK6w967fFRjm2Y83n2+2ZCO2BodNp2Af0="
							}
							code: {
								constraints: "0mMtik3qk0ikjwc62ztFLZlmSqa0RRhIwOD74U5jJME="
								definition:  "goFz0sCBpjpHr7PBuRMZALTyZBayS0BDi9/nRYWvTZM="
							}
							multi_step: {
								hash:       "4P7M1KGIIKBG1R7M4HASEEVCPNKGECE2VTDIARL6IFGHOB7MUOJ0===="
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
