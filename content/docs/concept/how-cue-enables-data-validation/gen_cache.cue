package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "rPc9rY8XFu+96Ea9bQnxB/L9eKTtlVYMMMUgry31HMc="
								"data: bryn (broken)":           "DI3dT20dZW/KhzSDmY5WISwhahO9hbBsgew289iQ1sE="
								"data: charlie":                 "PMfY9g0JxFGJHAlzJTq9sWir20G2Hyze8qIiViKM4vY="
								"schema: CUE":                   "PewpAdmIDpFiVWZbpLe19J7mpQBvaMEeyB3SHkf3tWI="
								"data: bryn (fixed)":            "zMgAaKqzkQwGrqdpT/lc5u7ykscm1qW9bR07R02qd/s="
								"data: alex (reminder)":         "q/9TeyQ+4oQS8Ksk91PVOg3rpaKcEmfNVPjvttw6Jg8="
								"data: bryn (reminder)":         "UbSR/EGV7N2GvrJEE5kDxH6h+PWe9Z4kzzbi2kx7HEM="
								"data: charlie (reminder)":      "hqFoGQAxF45uJSKm7hdtMYUni+44He3GVXYDjVfhXMI="
								"schema: CUE (reminder)":        "QPbcKuRD4agq7uJUD03MR8kRGP9IZtb8o2PaTOjSkWM="
								"policy: CUE (too restrictive)": "e36JhAshKTZ0Uf8hbQ3SJvZSOTUf45WD/YRTnMBo+ps="
								"policy: CUE (correct)":         "+tSb4rT6BOvX66KFPtbimvk1oDzoitEU1VAD1+rURCY="
								"schema.proto":                  "hGPFGohI/RVcZOjtaNdEW5tx7ly8Qgf6OzDqYtFPDN8="
								"schema.json":                   "92ZPc5ShUm/Bq3AKNvhe4J0WeD84LndCMAa2pt1MDV4="
								"policy.cue":                    "fg7rtOhFSawSm4Tm+4BmWRm64GzsuHJWG5wnxbtWvdM="
								"data.yml (broken)":             "jZ/uvGb87IeTsaZMGbsDiK0e7KY5YkiWT24wbj0/4Sk="
								"data.yml (fixed)":              "X2DMYEwOlEeLeOkOgbdRbR5+rHaB2YJBxOuJll3Vw3c="
							}
							code: {
								constraints: "oWblUqZ1zOCZkSA3j5uHjOOX0IrOLswmpFjBP6nxqvg="
								definition:  "itAsC38ChPMDBUfiJqOTXIUfu57qHTqtpX78PhIj0JY="
							}
							multi_step: {
								hash:       "V9DQ9D0KSOFS2M6FBH07ER6N4S62PJ07EBPP5O3JDFUTVDJOQ1T0===="
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
