package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "tEL/LHzcrkLneiyHV58Zk+wHfgLym3wj7u4bkISQAhA="
								"data: bryn (broken)":           "SxYV4XAqsxaD9/TQ3iMF3cI1knK0pA8ZpVTtuMlIh1I="
								"data: charlie":                 "U1n64uAaiwEsBeYdXZiTMqjjGbUTjv4ii5OVMKi1I6M="
								"schema: CUE":                   "hhOkbPF+Jy+qQfnwJrw1nrP1ezXKuBMcfo6FUF8nDgQ="
								"data: bryn (fixed)":            "Bai13Nysaw6FJELm10kgCwt2quahqwt7QGUvpdgTPv0="
								"data: alex (reminder)":         "tBz+XmVox1t31nrm9282NAhlMYFVgcHaG1/PB3ZgQ+c="
								"data: bryn (reminder)":         "nmikubAmBNbkCVsmyZUH7SIKU56bAEuu3TlAc2jNDJI="
								"data: charlie (reminder)":      "U3xYVQwwngPfpq7wTpl9W1erlJJyxHfeHX51l6iA3Ro="
								"schema: CUE (reminder)":        "SEehe1jYshrtgYGsr77v//q4kpiz0MZxy4n2oQyGsyU="
								"policy: CUE (too restrictive)": "i20r3OnmjBrV/Ayp4DGm36sXZdbxhFXb43kZG9iTzOw="
								"policy: CUE (correct)":         "q1zj2OqzUbQPOW1c6c+gzHLl4wlP+peFzCcr7Ti4Esc="
								"schema.proto":                  "ItEndKUKk9+ZQlyHEwDCYHzXlU1j4TIkkhS2PI6kpRY="
								"schema.json":                   "x0/UFMoJA7ia/1WaNFRZyjZe7irFseq/RL7hhkgwToQ="
								"policy.cue":                    "H2qgYP6m5MH0DRHYDoVhe+kR0gjSYkVwQ2RgZxKfhcg="
								"data.yml (broken)":             "1gajwIcrW8z7PJI0zs2bpP4pUeiTkwSjSM1CWgclV6s="
								"data.yml (fixed)":              "YwYqLEhKvj4y0UwatzrbDbwnajO2gVMhH/mqU4VEVz8="
							}
							code: {
								constraints: "UvDno+dLZIiExHwBl+/QWj0YLixw1QZid8407m+XgJI="
								definition:  "Cm3vYywW7n2sy15Cmc9vbct7//QIVevQ7Ec1yijUe4Y="
							}
							multi_step: {
								hash:       "25HP4JQE0HTEQ4U7OAQJIALCVMB8URP6NHF12R5PME8A1EJ0CA60===="
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
