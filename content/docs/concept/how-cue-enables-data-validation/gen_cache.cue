package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "d/gC5QbIP2VcWskmYupkKMGTlmEv4wqAd9d8+MZCTu8="
								"data: bryn (broken)":           "YwfKdie7ZphG0nMUF7xHWrMIErt/hpnj2s2PPCDHtDY="
								"data: charlie":                 "wIFmcvRdV6wKGeoO31ebrGeBFnADRveFGNoEii81BpI="
								"schema: CUE":                   "oWUaCLqtfsvn+oF/qV/LFdAAt4WyXF7yCp0hB4rpJpQ="
								"data: bryn (fixed)":            "rnNfpXhXvcVvRGa6alQ8EgAFAIw0r3o68AiCzhWLCd4="
								"data: alex (reminder)":         "g3b/4EOa2ciIwidxYIzM50G/hbPqtQ/z6grXAbr0rMw="
								"data: bryn (reminder)":         "Mbc4DkxKdDfLuBjOGkYaGI05uP+egclleyOjPuSzFDI="
								"data: charlie (reminder)":      "Dw5o1ptA1QLK4ebgHiA+acwb0+1JRwH8JLbv1VETolE="
								"schema: CUE (reminder)":        "dnAJZfo+nZ7A3hrG6RxkdLGyxiTThDpORvk34m6C7WI="
								"policy: CUE (too restrictive)": "h/7OnhC8DTYVsoGq2zLAaYu7FXbe7dYFCQZxyIJB3Lo="
								"policy: CUE (correct)":         "X83TwymMpa0/TaOGrYNSOcsXi2kxWjrC6PnrxXqfkKk="
								"schema.proto":                  "kcmaUAp2itHZAnwZVoVJn8CMSKdrw9SrOHUl6RstRvg="
								"schema.json":                   "1sa9crMorZn2FkZcoox8QT0gpk65k6ymWUnWK+DXs9o="
								"policy.cue":                    "Dir3Yeibp5+4PaO/EwkJRW6fjFcSmL8WZqOEn+R08SI="
								"data.yml (broken)":             "EFK9vkprU3jCm+UB/5ysk2XOO3RGjmaxS9dPK3adido="
								"data.yml (fixed)":              "z6GXQ+R/JQi1AAnSl0G9eAVbw6t0o9VgFkIWjrsEHQ8="
							}
							code: {
								constraints: "aTAwIp8A/qluZDSc2cK+8yc9sZvyrcVlbkN740pwEHQ="
								definition:  "hLxLgZyw54wqSBP7laBcK0uieZX1J7uw4Y1PgQjf3BI="
							}
							multi_step: {
								hash:       "UPLTFACCC8DLRM1E6GJI53SVAMFU32L14HCN1CKNE8UVPRSL7JT0===="
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
