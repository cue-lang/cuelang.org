package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "H1FtIws1xMz9x9RHVm2gVC3YQGan/WpZtyqOH1n7cVk="
								"data: bryn (broken)":           "cwmGkzZyTYZq020h7IrpIiHOZMxh+z2a59ibABi5dUM="
								"data: charlie":                 "5H0WithjT0NcjQRTwIXx2zbK/U6JD+OQvealE8TRN4A="
								"schema: CUE":                   "keFTQbWn67tjoNvP+Iash6ke2lCH9/TmUnzYGjGtuA8="
								"data: bryn (fixed)":            "6egokkW/DDLQCetcR7GX/LoTM0ChBBUvr1ivauWEZUM="
								"data: alex (reminder)":         "JjbXVt+Q0Xzv/ibPx9hUzfbvTGCQChYtE5csvU8TRac="
								"data: bryn (reminder)":         "YQ+I5a1HfM9ypgJuK0HnTuabYmgOLkjMh5v2HD3sxNA="
								"data: charlie (reminder)":      "hv7ZqTkIu1ZMfYmO4m+8Q83w/BX9H4yasrCwfqC1H94="
								"schema: CUE (reminder)":        "nV92vwRYrZytL0Q7JQTapL2i9vZOUMoJEDEpk2cb14E="
								"policy: CUE (too restrictive)": "90d/WjneN3znzDdZtA+yLz8/FNxJLTntkQWSdaDYAJM="
								"policy: CUE (correct)":         "+ZcfRQMDrSOiP5P1KjoNRi9N3siwSjKrF4QxyU5DVMQ="
								"schema.proto":                  "xYGpGGY93vC+QOdm/QfeISP7JlB3LEkW44zuDOY2p5Y="
								"schema.json":                   "+HwlALvter6YYjIiS6fnjTTTvyEe18lJNMPrcEm0ho0="
								"policy.cue":                    "EBDU+bMwygJOvb14ITgRLE6aBPtWT07Bj3DlJgH2/f0="
								"data.yml (broken)":             "DlaQ0MD2XRK2QWdTS6NixHVNI/3hEk0/HlYBG0MmOmk="
								"data.yml (fixed)":              "YwgpSxjdqP7u9V/fhqPxCpl1pduQpvUTZNeKHUtQ7g8="
							}
							code: {
								constraints: "A/k/3iTBnAAEau2GKNiVYVl6O4wHMNJrqw6yt9DLcAQ="
								definition:  "4xaizs7HufoqcbmFf8HoY5/2ZcLWMHJMLPy5YvOr7Ow="
							}
							multi_step: {
								hash:       "ITUDVNDHRBL75GF1C5OPK4INBT94FV4FP4R4561QDVAT9U2IP9G0===="
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
