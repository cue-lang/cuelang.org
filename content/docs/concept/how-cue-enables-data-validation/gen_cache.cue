package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "jHOrxHRbOgLRHEW8UHoaYG0DgLUQnARhAYObhAhmXnU="
								"data: bryn (broken)":           "h9HnY6xZ3ZHbal67HGFOGEmHFQVBrEZF0TxxdUbMsqM="
								"data: charlie":                 "qOwmDSqngRzU/u0ennFKzVnM60H3yadWeNVmGfGBSNc="
								"schema: CUE":                   "biWE+XRRz+vGsHrlOCjK0hY2ueMtA+3/gfyietq4J3Q="
								"data: bryn (fixed)":            "oJHR4qzqpt8JdOep97EETqUS21r/FdF5mTIJU9v22SA="
								"data: alex (reminder)":         "VtG7kSeRWetSrAUrCtb1FjpVu7i7LTkq+SykTyFIzCE="
								"data: bryn (reminder)":         "XHZbw6a82Bm2F6l1zwh0JC4VnmRy4F3NpcCyjxqaf/c="
								"data: charlie (reminder)":      "DVtDiczUOljD3unZUrCeUsu8LND7e0TGTOHcGMApSzE="
								"schema: CUE (reminder)":        "TyuLQ7mVM9MZI1GILC8681Ky/ro97/7F2BcoaZosm0E="
								"policy: CUE (too restrictive)": "0gLNTjhetYRwMbFTun2otbn1SvbLsj9uXsMrexg2g/w="
								"policy: CUE (correct)":         "fE7HrqNCr03kyBoHCif/IjOAX2/wEiT9cGzNKsF0VSw="
								"schema.proto":                  "Qztq0PdFa/zAL2dm20SKmqu+KEjZG4tHycBFEg2h8qQ="
								"schema.json":                   "I3y9xpppRnkx+pF7r6/G45Gm39e5I5mXi/5nE7/mO3c="
								"policy.cue":                    "bHIyCVcWe9UvBUViBNWbJYJ+ZY/3CsPejLtXE2FPZeQ="
								"data.yml (broken)":             "kGjjcstdCv9pijN+SJgi65r+1AVPqbCDrOdi6fcgVV8="
								"data.yml (fixed)":              "ZIPevIxGpawSuSqhiWCp9N97WzECpDbmSItye9Hi3bg="
							}
							code: {
								constraints: "7SlSkHLKAK1amebMK9E6Q3cDv/yS16rfGCs8Zn3OROk="
								definition:  "Bgv3HRJfksoYU4Z/pN1yQaYicqnxa8bcPpWZ3IlPMfM="
							}
							multi_step: {
								hash:       "HLREG7209B4OV5C7LT8PTE4RESP5KQ21U6RIO0LIU80U7H0V098G===="
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
