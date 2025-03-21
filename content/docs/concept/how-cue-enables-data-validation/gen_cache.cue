package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "SK/OEJTiMje+zvhdzAP+U1UrzGRwtB0dEGnQK74hJ9I="
								"data: bryn (broken)":           "myX0Qzy7rkpTztrAGzldTqw/8u8ZgQ4eGJkLzkrkPyc="
								"data: charlie":                 "PlghJu4QXaTyrO4Z9Zz7OHW7M4vWQ9CT8f/r948pukg="
								"schema: CUE":                   "vZOF5c3b0L/1/ps5xpYTzJAxmXrWClXQ/H9Jh0XPFZU="
								"data: bryn (fixed)":            "5WGr8gAIvooxq4XHZ04/H/TmKtUec46dtyQ/9vIazl8="
								"data: alex (reminder)":         "7dEFO7YBatl6fGOuPMX6dKJFQJLMcPHtxWOxNerJWrY="
								"data: bryn (reminder)":         "nGgQAESXqZ43ZDLN/z14YfuPm6FHH2whJzgIlMJ/vgY="
								"data: charlie (reminder)":      "3VC0heeYF/ytjCmR2Y5to+aUW3riNcwWwOGv9M26AlQ="
								"schema: CUE (reminder)":        "HYGFx/wnYXMzHBE6E+kqQH46RHrkP609S1GWkVyCWQs="
								"policy: CUE (too restrictive)": "9TnZpdK4mBxiWt8d7ygwlpj1WWcEZX5/SqW9Dr23c8Q="
								"policy: CUE (correct)":         "G4iqu4qa5qWU7QhdTNria0i4LHAM1z/mKshX7ZaVhIQ="
								"schema.proto":                  "05uByXVNZ+NBc9M/gegErLstd5/CtOuYrrjrn/XHfOc="
								"schema.json":                   "9Dv7jOqLzQU2R9iSy5R479e1ucCIR2xET9Sys/6Pu00="
								"policy.cue":                    "V3RoEb/NJUY4JIJz4qBvB4CzW0VKvRxqnA5Paj07glo="
								"data.yml (broken)":             "jDdele9ZroYY99QRe2qJfG9oVnH7pKH866gSJXFjqgU="
								"data.yml (fixed)":              "qagpxgqCn7R9GTPW4Z9/IZ5r4aubBahxCbwYmCpVhzA="
							}
							code: {
								constraints: "/5T/kJkPlHNaO74H0CRNFX9ElRR5Gv3GcXF1FmYdi5c="
								definition:  "WfsrrSxb6it0UbmTz91htO85TdBJwKNWEm/dNKG6Sks="
							}
							multi_step: {
								hash:       "LBV6I2U676U354H6LJUC85UGCJJN6LTLNGQ0QO61HILQI9M1538G===="
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
