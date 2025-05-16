package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Lya9SKnj0IGED2DDPyYQiMLrbm+/Yo42UbmRrqVQoRg="
								"data: bryn (broken)":           "YtY1Dfyu0vqh0LHSDOPl9vrW3kvpFkHPovzDmd5ygac="
								"data: charlie":                 "M+JuHoZUVBePxib/L40F0V7aH8loRpButid6onP1J/Q="
								"schema: CUE":                   "+WrKxfTwhxv/NInFiR3YPGiTlqoxg2xvZ7FLWH8E11A="
								"data: bryn (fixed)":            "mXwF52u1TsE0CsOaMkm9k/eSwEt61aEWgcEgJ8eq4t4="
								"data: alex (reminder)":         "OVjQhskBlqDu9zCs9qO9Ynch+H5kpNkmYzneND96w/s="
								"data: bryn (reminder)":         "T01gmi0blI8rfxev1/UaPU8Zatk+Ix8qMnvVe72xTfQ="
								"data: charlie (reminder)":      "f+0ef/TPfF1P118mtCb2hmbfGMI6jGg/K/JLqxxEfFI="
								"schema: CUE (reminder)":        "+7h6Zw9mNyPOEwaLFIkGrngJMBmnwdeHFeRHV0uzqgI="
								"policy: CUE (too restrictive)": "aqj41B59I2XYTunqVuSrwnmExIGup1gEIrJNJ/vKd8g="
								"policy: CUE (correct)":         "cVekSYMx4QVm3yhq+ilP+G3URSOEgkgagIxti8rggqg="
								"schema.proto":                  "wxraHbaL3abH6lG9zmUw+E4dZFCve1H3dgdZOALVHKY="
								"schema.json":                   "uNRKNrf6xvjo10dD87OfG2G5lWR+Y8f6P4OXa43ajxc="
								"policy.cue":                    "H3gn7mwEISo5A5hAKkUYZifGaljfyhdZEtWQw43PDrM="
								"data.yml (broken)":             "EJyop5cfUuoB5viMdvpTRuGc3WVIVCC0ZXF1Ch/wvVE="
								"data.yml (fixed)":              "5NK9EbwACjFNKv7Vu7HawParQFOZC/smAYkWkxcJShs="
							}
							code: {
								constraints: "ksV76InXnPu0f0YRcDmbkn8SoVy6LleFkX118ra5RYI="
								definition:  "2Ug8E9tIPBI5FNjVLwJSY62Z0lt6jIs5o/JtNp8B4Tk="
							}
							multi_step: {
								hash:       "46523V95V408E69LI664ETAHBDKD3FH1U5N4GL7HO7LUNI32N710===="
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
