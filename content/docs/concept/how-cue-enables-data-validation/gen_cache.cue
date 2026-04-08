package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "CAs2kjyZ3hK3OYFqJDMiQdb+lK6wD/+mj8dTkSg14IY="
								"data: bryn (broken)":           "L7S0zlH0CoaJsMAVG/m98KfKtnleZQ8YblQeQr4ICVA="
								"data: charlie":                 "utmjdQtmPwIQ/LrwbqkvphCd+avj1zcaTuQElQJI4lQ="
								"schema: CUE":                   "SclSGMXyPuuMrBDeEauxenTZoUjBIaUfEHg8B+nrCt0="
								"data: bryn (fixed)":            "JrH+hMpHWvPpxsZ8A8bD3e16emNTrKjo8T7EGg2qL9s="
								"data: alex (reminder)":         "y8nY0UZKLAOCUqdhEV5HEHnqXpN1b/CvsE+ntW+Y6Zk="
								"data: bryn (reminder)":         "NXIFBroydntg7Cg7lRdsMiXJE5Qj4PveDpPUjbJ9f0A="
								"data: charlie (reminder)":      "aZ2TI2RObsWZepXSvW8tyW3rDG0kbzOqF6Zu4JIsg3Q="
								"schema: CUE (reminder)":        "ZS1qYMZ4VOJzNfUlzXdKdLkn6uLztK5PBaIXtex8cl8="
								"policy: CUE (too restrictive)": "jPufFk3mgyXARHrvxp5AlHVCDKcFpLnMZa7BxSYAkgk="
								"policy: CUE (correct)":         "Tvgop25kYvNL6yfEh3+jTwx2FGSjHE99ETZIL0l6uV8="
								"schema.proto":                  "87H7bUowu4s8jWpkYxeWX4b1S/18pQ+HkdqlECRMqyo="
								"schema.json":                   "K8F88NqCclEiX+FOUbrc07D8Yd2JxMtSwjF7DR/UmG8="
								"policy.cue":                    "Nj+OFEmkQuZy47hlm4bLZodmMljo0YACc3u9xrNt8jU="
								"data.yml (broken)":             "guiheannx4ykuuuPlw+U0ER04ZM5cGWD0kTOVsbUBQ0="
								"data.yml (fixed)":              "Mon33+MTt1EDqKZYHadOppQ3PPRrRydUETcr7ycNZ5M="
							}
							code: {
								constraints: "pFEGMCRC08zzj56WayUvPYSYmhLEMAkSm4NJZHeZOq0="
								definition:  "LXSx4WUo1cg/YmvPuaAImqvlpyeO74tTUTtkNdpgxhk="
							}
							multi_step: {
								hash:       "RUILQSJ5ODBO943OJMIJR4QUOO3FL709PRVNLHTS39MEQ2Q3JUU0===="
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
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
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
