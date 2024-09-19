package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "tkFQVD9/gSotijdcl99D+k4VB6zRKbCH6JGTUD7ODEo="
								"data: bryn (broken)":           "9+fTNex7j3YGXRyR1Mxj8ZVLFBQ/BAI/bIvwsCyxg0I="
								"data: charlie":                 "SKRvqzefMnUWgrHBTeo0LxM6djTIR5UbC/ZLQVXEFTI="
								"schema: CUE":                   "7ekhw9HtU1e5P3b7n8lZLcYfjMYxD3SX48gh0NDPEfA="
								"data: bryn (fixed)":            "anoGO6OeO8DYYbDlp5LE2AYIhmMcWbKy8QLyrgg34xU="
								"data: alex (reminder)":         "l5vNhbYKLbCuGeYU+a87LDtiC4qCTA3s2uUOkP9Ez1Y="
								"data: bryn (reminder)":         "4neS4tGhIAXXZfvFDH96wLkRuAAzgsAb68V6HhsfElk="
								"data: charlie (reminder)":      "9q7iKMptsjHGxQHXYOgroIamyIfJVDdOQTBFxYAro2c="
								"schema: CUE (reminder)":        "CVTQsQQtQ6hGmAvBQ35VxAbWpO+VUc28EzoofFjv4So="
								"policy: CUE (too restrictive)": "HJO0mpG9fKQLxKBjQSRwCqvZTEkIUXZuCFoc26nVewA="
								"policy: CUE (correct)":         "nbt1OJwirDf8nNUtpwDg9Racnqhk/88gm8eQW5hv2Sc="
								"schema.proto":                  "RDwPIJStz6ewio7AViXOR2P/9uyv+npfhGvDmfltjLA="
								"schema.json":                   "IYBOzLUiX4N23FICPofolXe+RXVEC7PZ/YHfWaPl4Xg="
								"policy.cue":                    "C2IstnsgYirKrideEay7vbW+e2e4mIWVIOMqjusMQaM="
								"data.yml (broken)":             "T1HfM8EDRu33k+lMsXibYqXlv0IVLPikZumH0h48d+I="
								"data.yml (fixed)":              "4jPYzFbCfOJF1bCheyEC7xQdf+TIR4ea2fngHEYC6Ps="
							}
							code: {
								constraints: "ifIKMGef+esWtMx5ltPtTRUF9l7ZBPA3/jxqOFqIC9A="
								definition:  "T3T+7HH58ZHxRt/A7FpGpAj9eGvMhB552LC6PvPvrvk="
							}
							multi_step: {
								hash:       "IUPCNCD38DQMRPUUH0665BG9HE0BFG0SKT6GQK8F56A82IBIC15G===="
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
