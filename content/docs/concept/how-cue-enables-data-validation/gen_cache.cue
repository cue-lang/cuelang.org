package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "YBDDD9W8DvcQ+ry4JCADomJVgB9DhacDeTj1OnOiSOw="
								"data: bryn (broken)":           "/GEImDkYVa6lAfcTOFX8IvI2zFyBn7cjMx7rBJoBxIk="
								"data: charlie":                 "PxVH/0GnZx2YkS2aWEzecttoj5LhZBib7nRqOtmPBK4="
								"schema: CUE":                   "CHDBdTlGRKcBM9/yfIaaoygcz3YdGHCrA98pe9Bpljo="
								"data: bryn (fixed)":            "nnpm4gCng4IygkqMtZC47orCWUeYedT+x4HzpkOY6T4="
								"data: alex (reminder)":         "DQ0B2EPnMNtZvdgrksVsgXlzgsZnA+gvsYcT3omN0ZM="
								"data: bryn (reminder)":         "qbAPAUXt6zCBCU0HeHZspaLZRvAsc7KrBbZnem8fL50="
								"data: charlie (reminder)":      "PSkRrDLgcD9VPspF/PdMl7l5FmGX61AuZ9Yb2IBjFn8="
								"schema: CUE (reminder)":        "RJaWRbt8JCJ/rqcFhax2vW8ZSctpG0piMKeKi5NDQdo="
								"policy: CUE (too restrictive)": "yH7PBC5wILFHVD3f4/zcvrwtzJ/U+Y6a13TpK/Sa3Mo="
								"policy: CUE (correct)":         "vg/ZfNwb5bp+GbJklM8Wrkr0PJKET0xCvp194yUaFLE="
								"schema.proto":                  "XIVN7LeLhIMXob+LtP1f5v6n7rf+G7fJWeSGrU2o4KA="
								"schema.json":                   "UXOutHTB1RybHdy9QS6NV4yHBjRO/YY5hQVjtNPQRbw="
								"policy.cue":                    "JtheYuzZzPAv+DI6AyeqI5azrfM2K90/dv+uhnZmo2s="
								"data.yml (broken)":             "quKBoLHdGFVN7PN+6hTFHhEb3zhWeH+94Iy8vsfbRNQ="
								"data.yml (fixed)":              "Lp4myZ5s1PgZrfSlpFKel6ZupHB7+uGm0U0+dm/Bjsw="
							}
							code: {
								constraints: "6hj6fmKM8sVhg1JGRzcBfAHh/taLNuSAMLO5SvJa/IQ="
								definition:  "P9UX0JQX/lBuq+Y8798pY4ZJU/j8o6IU9Muf4PTJeTE="
							}
							multi_step: {
								hash:       "3FQS0KC0JF36B4BQMA26F3IHU6NJ5PMP0RPCTGI2GBQB25J6VT10===="
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
