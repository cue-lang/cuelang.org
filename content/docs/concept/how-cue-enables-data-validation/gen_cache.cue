package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "pTmsdZkbpR4ia2nPVOb00aZuCtnS3FFVFgrZrW2y6sk="
								"data: bryn (broken)":           "x5b1b3gRuvhuJV3aVhTzuo3GMHHa/8HTj5/6hhf34vA="
								"data: charlie":                 "feXvgtKftit4leIa1hxgaCbUXdpQQxLgmEktFTnx4ig="
								"schema: CUE":                   "XVbTwEn/V6DVdsF3IAr29XBrzdaXQId+ULCPOcd8VWw="
								"data: bryn (fixed)":            "5s66AbamR6/oeUJUeknVWy6hPfDx7IlkmUt7khl7Yl8="
								"data: alex (reminder)":         "F5/0GyOcPMI8avBSOCbQKPatcqQbOPTi3+r9j2eDQ8k="
								"data: bryn (reminder)":         "ZuPOQvGMldqhws0ygib+Ceo2y5OMjvpmhCqWD4Ipzy4="
								"data: charlie (reminder)":      "HWshW8N9FjwJnvR+Wzsi69ob1s+zDpeJhxQQlX/JgS8="
								"schema: CUE (reminder)":        "ZI8L7JltlFeV2Vqq51xT8o6xM603/2+eqUr3V/GysHE="
								"policy: CUE (too restrictive)": "R4QYLFSIxRrdrBC/2E/jhTsWsDAVW55Vd03PXiAp5y4="
								"policy: CUE (correct)":         "UJC4IekerKthNsNHx/NToXaH7h1nvUxl/RFhE8L2uFU="
								"schema.proto":                  "b12N9KIDT/LXb6UVSUn25kiemouIA02HbU/x4NuaZF0="
								"schema.json":                   "wVp5vZvhjZSEXiIrhBysjtEHYEjRs9IuyAY6Qb1P2gM="
								"policy.cue":                    "UP/Y6EpzwtaWRPP5ZgWRHKd0tdd8paBOzx6Cjvqpc2o="
								"data.yml (broken)":             "vRGGIhxU3zgF0ta1Tbs2JfgRNMcs0BkWh5YKox6gX/Y="
								"data.yml (fixed)":              "dcTCaJNS6RIkKNuhzoFYIwXCcBURHO2GGwHHT/A6xtk="
							}
							code: {
								constraints: "v6cmMhmYNathVMXYr5yi5mnHk4Mg97odg3S1TSJ+VuM="
								definition:  "O5Ax0SIAQJDccBkp5Smyc+frMjRDdlxjYaiXaWNfqVo="
							}
							multi_step: {
								hash:       "EHDENIBD9OJSJNGOLM12F23INR87L5B210TBRMPQBPHDHPNJN9F0===="
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
