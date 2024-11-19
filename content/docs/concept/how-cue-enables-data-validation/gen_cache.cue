package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "oqELnBwsl0FqT1bdbc6fe9upmQalUsAjAeozj/k9E7c="
								"data: bryn (broken)":           "i99qOkN1ZjB1XJteZKaBrT+ANbOuEbrvC13rX3tyDck="
								"data: charlie":                 "gaUfuF1koJFhWE3vaOFbHPKxGIEGa2WxAbzzWpjKAlU="
								"schema: CUE":                   "NQDz80DXbeTz8c1PLPysOdl7GgBmE31eNazIbYcQ0A8="
								"data: bryn (fixed)":            "TjhW9nB5nWzjYb6waK2TtJljO7hMIZNw//eS7mISWk0="
								"data: alex (reminder)":         "RCK2qDFr7dN92M1ed0cffGwJ0AqZh0KsMIc5bWrpY4A="
								"data: bryn (reminder)":         "Kh1jKaSR/schvB60pEYXoQstYt1ZzL5K2xWtvF1KdG8="
								"data: charlie (reminder)":      "hM+wpSA1ps14R+iGGggMa+O4rCqKng04+AuBwb5R4ks="
								"schema: CUE (reminder)":        "YMvY4E6nrGpI/SvY9mBUp2jVCq9AwH6EGhPHUL87hnk="
								"policy: CUE (too restrictive)": "lAtFeDjbEItiLF1Ojr9lCXZaT2v+B3s4UnDjaJXOxig="
								"policy: CUE (correct)":         "IL35SqZycGAk6wYRGSslRjrdvEw8KRp6BLJYPzWuTr0="
								"schema.proto":                  "jQVbDWpQb79VI4y7tcllRQT1v3F2vdASjDG0S1Qht/c="
								"schema.json":                   "Vp/6+QgaJeJyjQaox1ZJgyKvFsBYnVLivDh8ERVhysU="
								"policy.cue":                    "NJdA+nNVKdM1T5sBR4GtDirvZr0H+iWF8PDpO9IL12o="
								"data.yml (broken)":             "YTSgO2zd7lWj3cYLALJJKAqpJdoS9m8ylityV5s4rBQ="
								"data.yml (fixed)":              "CnSbvtjtLJD8DJkZZY17jJzBqFb7VF66R9w5pMIP+nw="
							}
							code: {
								constraints: "BKp9uvOF+a1Q8nzPEM9IHSXlT/LBgYItIIc2Np18ts8="
								definition:  "NSHYEAQ4DSdaT1d3sNvBiDcP/ivY6uFi0FmGVBwUeXM="
							}
							multi_step: {
								hash:       "6G31UNMINLJLL0C47ABBGJFOGA6STEGL6ONDG7NG025GTI653V4G===="
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
