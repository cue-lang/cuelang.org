package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "bSSUmcx1WQFV6PM9yw7UjICaYaIMq60ei+Gk4tvnPyg="
								"data: bryn (broken)":           "l3ZyAfaauZnq9WwI40IZHqgb0jRs1Olq2YJEaOMCpQ0="
								"data: charlie":                 "0bWwrjPn+Fgq6YNHlpVdU2LHF6Cg3EVhubIoCdilU4I="
								"schema: CUE":                   "Gpjawsg3/KjFJT1b4T6q23V2hoZ1BR0rFMOG+AU4ZWU="
								"data: bryn (fixed)":            "R6/6QatBVurel5hbAKStkUJIGDP6p89EoqwaaR4n/1A="
								"data: alex (reminder)":         "1Rs09nWyRCA/LFW4K26B0O2nSR49iDODdq6U/aFXAgE="
								"data: bryn (reminder)":         "KzJ4yT+mght412GBcuqgEXscDaGstjS9S/s6TxNFNo8="
								"data: charlie (reminder)":      "9t97SJisicd6KTfH4Ayu0Arx+g+49qlvDmSazWQd7Vw="
								"schema: CUE (reminder)":        "Wwlx2bCYGgpOfzCJVfN9YhyEO/AVYoDfgLUN9XfwFeI="
								"policy: CUE (too restrictive)": "GCN5ip4wywCGDCgvonP9/gdQsgDhUbii3/sGKyPKrEg="
								"policy: CUE (correct)":         "YL3g8S1/KHhsNmEXcWA8t8kLkzy4dcsecVMJ617iUPo="
								"schema.proto":                  "+smfoyJ38m/GwZbwRXEgIsD2bby36BaW64C+KuhmTag="
								"schema.json":                   "aa6+PbfVs+ZKc1DPqFw/qGHDxgccL43Dmnq0CLVl/aQ="
								"policy.cue":                    "CHuWzQKOFFJDwtvlRSW0LX/J9x+3hyVjsD/D6ADWgVQ="
								"data.yml (broken)":             "i+d2L+PYdyMlLf4LjDCAokxGHQE3VOYpYsUoG/ruAjk="
								"data.yml (fixed)":              "tzHrUw+sqrfGen9wv9fKmEI/yPJgACdLqSsGcl0kAxI="
							}
							code: {
								constraints: "QCaOPV0q2KL71z6/PmI3/VI79cBpdszIWSLnQRbjxCA="
								definition:  "l4D9A5gDyVmnACql3RiCRci1PFJh9B1//JWkljkRvd4="
							}
							multi_step: {
								hash:       "GC9CGG5CS61OTITKD50BO62A64MO6KVRNL2U3SBNCEK1857R1GR0===="
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
