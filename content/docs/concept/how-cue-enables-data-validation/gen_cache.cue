package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "OGeuutrVBt2aT8CSlOAYS7tYhC3ldujGpRntVHeJCag="
								"data: bryn (broken)":           "IAGYu8HDGExjtJsvz0GnetPtxgVsSOoVtI0qR5sQZg8="
								"data: charlie":                 "J7GefXPj5+vHYdMGw+nY3VMdpVCexnRKgO00U2taqDk="
								"schema: CUE":                   "5d2e6O6Wvuo99k/pEklL7NVTUxZUSXFgzKcxfYwxj34="
								"data: bryn (fixed)":            "+TBmEzVUABZFXE1D8yb4fs2NI/fPcNPQOEwk0ZxvSsI="
								"data: alex (reminder)":         "Ew4keV9ddSccrlMCVjBJxIj1RbnW9sDmVi0820D8UQ0="
								"data: bryn (reminder)":         "ub3aA+lapwhUJygkpFADVcWS34U9eaBs7YWlasYBT3o="
								"data: charlie (reminder)":      "Ae9MKbAfqY3RdizsRr1i8AL4RTv2Vd5N3eLzur51FEM="
								"schema: CUE (reminder)":        "HMi7gfQDKQ74mTHueghMSHjQ9fhqo6NxK4xsUhnjAiE="
								"policy: CUE (too restrictive)": "gFR7GZEY9zImFwyzrkJBzRJ0Ta9FzXjiHSMhmilc+Jg="
								"policy: CUE (correct)":         "AUa6xdvRFCR8Dp6WKAmNOD2OiYrdNmVLJ7uEVGU+Y28="
								"schema.proto":                  "4/Ggc/te2jFFIghEOKky53t+0QKwEU5vsTC0LRbVuMI="
								"schema.json":                   "bB/yGM3TQ8RqAyfQP9ZNU7QFDbKEZGQaN8eamIGq6T8="
								"policy.cue":                    "qrG0ZXtza9i6n1MHuhywVthbXmoKkXAZazrbZxWI39E="
								"data.yml (broken)":             "Sb2aarh+NYEcGCsC2d3qMSPoqTdwcmfZ9r0VV2KHp/U="
								"data.yml (fixed)":              "6ivw6HdFY3Wl62+hHU+J9pQNIa+jw9EBMdL3t/wZY/I="
							}
							code: {
								constraints: "+I3aNVOzxqzMqqwoxdvZg/kspbflJgujuLndtqZKrYo="
								definition:  "6LGDdpSUSkDrVBdH5VS80YUYarh8TUYYzQUH860gkFs="
							}
							multi_step: {
								hash:       "9I20H03VEONQKHERR31VVS4SCFHQDDIF91FQ8R8R9TLNOUJ36R60===="
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
