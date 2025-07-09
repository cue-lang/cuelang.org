package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "DFk2AhT0EBbuy73NFqrXDBCz/KkX4SDozk1FhzojxSU="
								"data: bryn (broken)":           "6BdguHULFPj7kIM69gSQ59sExyvvB8GJniESRMHb4m0="
								"data: charlie":                 "pnEaN5TSWroyQ2NMs6JCZ2HdO6oULn0Ty5xmcAdtoAA="
								"schema: CUE":                   "Fmcka+RW2wXT6YH9hKEOMbt7Apj6ICUYeE3J+xz+t14="
								"data: bryn (fixed)":            "PoB0YXVCR2K2lHS7LFYzWx2+v/Tq9gEA98WjIUgVUH8="
								"data: alex (reminder)":         "ewrZZLkllfm8GRA2G9z9oz/XYWJ/zodAO30C/Pk7+Pg="
								"data: bryn (reminder)":         "MCvlJe1pcMEkOjrGkHVa6PBnG2PB6XjFt7h5Hci7Bwg="
								"data: charlie (reminder)":      "pCvNldCcLbTLQEFlesGjHQhaK3HaSkF9KM/Em954lY8="
								"schema: CUE (reminder)":        "pDxaphiH6LEZwnGMJQzYppzNgs83AtB1zsJUDYtmjXE="
								"policy: CUE (too restrictive)": "wcA+GdSHOPuhYaQVt2gdwrgQMqEnQOx2dfFdaigyo6I="
								"policy: CUE (correct)":         "MCmYnNZzSuwF0PAhpoxbpQWghpAFCO3tJEnfN2Tej08="
								"schema.proto":                  "5BBvAtLSK5KrHzW+dNyhxwoszF+L0+Bxm2wh1K5vgFk="
								"schema.json":                   "W4Lr2jvjr6DWxy6hZmAqNh5bYV8tR0A4g5nd+APU1iM="
								"policy.cue":                    "xPsfojbfjTg6ujcN1RH/ks7xtahDnDMTI0JRDyiQlAE="
								"data.yml (broken)":             "0wV+pKTPgOMu0ZA1fqJRYGmhCgrqyaFstofmnG/tyuE="
								"data.yml (fixed)":              "yskdHzhuovsSoT3p/RmODs92KaEYYPcrk+1ElpBUqBU="
							}
							code: {
								constraints: "+JjeJPXPYI54R7+s8L1TW74Fwgnv1Jk53OV5ZQyK4n8="
								definition:  "utiWXjDuBPm7ARbE2fVsqM6RyZ1mSkvbhSvilGU9jkg="
							}
							multi_step: {
								hash:       "5E4V9E18HOP6JPQMQ253THMQEBA0PKPC0I17SHSN1LD1K0ITGBE0===="
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
