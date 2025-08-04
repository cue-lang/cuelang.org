package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "o+XaPg3JStTPSCixoaUIO3bOGoLiAHPf/oN/Jom+kl4="
								"data: bryn (broken)":           "xUy7nTh9YLts+C6DKE/+Hnk8GDdv0ifzk75CSRW6/Gs="
								"data: charlie":                 "tt14O73wLfXysJoCFN0c1MHrk5Wf8AHbDG+PjcjxfM4="
								"schema: CUE":                   "8lXg0qmcTyaCv8e/PsZpOKijDtgndxT5V2TlTbm54pQ="
								"data: bryn (fixed)":            "P82nk2/B1T/S+sWOY+chUz5bcJPdK7cXQtS6V6EogzM="
								"data: alex (reminder)":         "UkJKqAS8f1xFJA7pE5o7L1jFkIvB+NPstCtty8Vmzd4="
								"data: bryn (reminder)":         "9AYTHVrN7LmA+S2aUW+Yv3F49u9/ZtAtRMa9y8Wb+tA="
								"data: charlie (reminder)":      "QzkWubak/oY3XLtA6g09Q1IGoBn6iiHnmQ37+T2e90Y="
								"schema: CUE (reminder)":        "f9L+odW6xXWCUlpTyISvZrKHGa+MOBVWojPRQYZaEYY="
								"policy: CUE (too restrictive)": "YvmEKCeD8ohHRPE/wuBPkmgfCvAXiO3MwnQy4z4rz7U="
								"policy: CUE (correct)":         "ejptI+GcuY6didlvjpK0h+XL2VJjWSooyL4SU/Bogzw="
								"schema.proto":                  "lUbZw88QLg0mfopupAmi1acm6STc0NnsJaOvoAlzrIY="
								"schema.json":                   "ssL5vIXFUJqfmE5Us90CgsUE9Vy6qo5O3hIp+rFxGyo="
								"policy.cue":                    "fFxgIMKnW3Xy3vtrnD6PdeBemI/5kT+0KQEiTxJmcTE="
								"data.yml (broken)":             "br6muuBU5jW0baJGqQkMO2svTFRCmCXnwg1u7Xx7dUk="
								"data.yml (fixed)":              "QOWLgX0tbXhkTZ44+DFJLdh1DBTydRTMSH+dbwbUBCg="
							}
							code: {
								constraints: "dHPF7ZbvtbJt++rDP5SmE+egTSd+yhw+GpSUz/1O0ds="
								definition:  "10Y25fMeIScYsKY98rnDM2eB7Xtec5AzAbd8uZHmJcw="
							}
							multi_step: {
								hash:       "2LTQ99TS2765U5CGIHJ252NM72RJ7NOG618LAL5DPNG25T4F57Q0===="
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
