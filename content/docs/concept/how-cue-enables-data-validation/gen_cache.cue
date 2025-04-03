package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "lnFKjR3mcAizCPRXy8zZjrLZCQHxRfU8bzVKczTFeMM="
								"data: bryn (broken)":           "fyV2wpCD34EaF0TAafgY+o2klGI8F93t9Z1poDdL/oQ="
								"data: charlie":                 "5vLMf+PVhLBlFuqXM7nbfLpjNbnq50jnTL8yD0ru+NU="
								"schema: CUE":                   "wcspF0pfNGd/nGYJKbpDvbIadPb42hgQRjhpLEPZCWc="
								"data: bryn (fixed)":            "bNTE67HbNEwkFGbdXQw4wgLvELPjybaJsCPEjE+JmZQ="
								"data: alex (reminder)":         "ViFDu+9ERvcH2CLRxwiNQwZTJDhsAfpNEEim6vgEOWQ="
								"data: bryn (reminder)":         "eS0FkO3yK/nS2pM3wUbeYmqerggsOANQpb/G+b3OuF0="
								"data: charlie (reminder)":      "pGgrWbBJT9Lgu43vgmn3tUPXXBpOALakij/iAgk8z8Q="
								"schema: CUE (reminder)":        "ZkuB1vG0lmyvhQ3vUoLXOgeI4xBhtfi/sTVnCSK6o1E="
								"policy: CUE (too restrictive)": "jLw8nr7dS0kjS6X3Gx6B0V0eBJCdAgwCaA2K/OnWEGU="
								"policy: CUE (correct)":         "2WbP6WL8XUrrdIBr/ilbl08EAvlCMH32jHqpxfnmXAo="
								"schema.proto":                  "ZdavZK4iewMo8jjw9yZ8W0LKnz45LeSFfni4FHoKtO0="
								"schema.json":                   "TGCyf9rdlwX5+8dSb/1egxCQpPF6nlsgOKTBlttrEAg="
								"policy.cue":                    "QKloGBvmN2jbxBHQgkfILEdWn0+MWSiQk/tXjsrvtfs="
								"data.yml (broken)":             "xYs4TGMSkamZR42dNKy+Y1eFhAZ6Gd0H1RCBx/slky4="
								"data.yml (fixed)":              "HGPxY2xr358XF/Fnh1zek/6XIGtwIUtHA8ufx0rqQ6A="
							}
							code: {
								constraints: "OSIyjmyy6ON2YLePywiXFFZreUAse7G6blVinpEA1uE="
								definition:  "iOdqLEKYInp6rgP8di0N8gRdvLVsf+IjJrCU5mZ83b4="
							}
							multi_step: {
								hash:       "9TSNT7K5NRTF8H1HI5JC2O7LB8VD05993R9I0H1PNDL0AT02P8S0===="
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
