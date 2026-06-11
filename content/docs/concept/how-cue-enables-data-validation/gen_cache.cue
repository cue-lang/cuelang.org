package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "vEN5s6Oc+3OD3rTOOaCk+Sh6ZEajGJAwLWsewFdQ1pA="
								"data: bryn (broken)":           "Am5PBxjbqtzIP9WlOYKc2ga5hPsVq+eQ26H0F79og9s="
								"data: charlie":                 "aWkg0I6yyeBZagwuHhsxKN9XDzSUM2DZv1dxQDYfQEM="
								"schema: CUE":                   "u+cFbTHNT0If/piV0005GoP++BqfMiv70sVQXivp51U="
								"data: bryn (fixed)":            "c1HiX8DRyyIAdwScnXzfmubUAZOkqKl+6FVTzuSnh08="
								"data: alex (reminder)":         "k65/bIxyBBfz5EXYoPVEOABBehqCHPZeRl5d2dkfPz8="
								"data: bryn (reminder)":         "/yu8Mn4CkphyCUDv7jW9exbJyZx6l4NW+y9dKFGQiyk="
								"data: charlie (reminder)":      "B2iKi6GzRd7T6ysTmy0VL0SY8qxUrDyMdZZVRuvGBtU="
								"schema: CUE (reminder)":        "gSjHB9pIgKKHkOLvx1S5Min5osFOAEtwxZZmoctEiNU="
								"policy: CUE (too restrictive)": "2F60yfV39ISv3XpNRFCjxiNaIU7UXS40isDDOZZzTb8="
								"policy: CUE (correct)":         "6LImo8/LgftytRuz4wrXlFzDTkSeTNuEkmC0qxpBMoU="
								"schema.proto":                  "4wrluwpbpymypEog4PIdA1QdmHwXoBzoCpnPw9aIh60="
								"schema.json":                   "rRI/J/5Njhp49SdJNT8QbCzJxVWnc0M+m0k4QDVQgKM="
								"policy.cue":                    "3R2tddpYE5yvoNI86ig+P3Dg/VDc68FqDz79CKGxt+c="
								"data.yml (broken)":             "YhA8lUQcg47dQTXz3asLUq1wJx6h0PapIRGN6QYQfLQ="
								"data.yml (fixed)":              "qKvRrSWTPvFEtCgq9AfeRTTOaoLMksOIiquiahUXYlg="
							}
							code: {
								constraints: "jiagTbviObKr9jhOle0ahUy6ClL7YSVloLlnaUK4nQk="
								definition:  "9bP0tjNDavACaGJ95aGXUo2n0iLApMIvigVszqIqvPk="
							}
							multi_step: {
								hash:       "M81814BD8GIK4U7UHS1S1HIMNHE0UBOS6ODODL42JLLSPSAHHMQ0===="
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
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
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
