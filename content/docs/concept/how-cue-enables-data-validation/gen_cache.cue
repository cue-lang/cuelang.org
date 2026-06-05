package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "/N/x88httz2JCR0adoICC3NWnP6Smh6PqeYr9/6I6kM="
								"data: bryn (broken)":           "laK+Aa6MXRltT9DGB9PcgtRCe4stv0PgNzEHw6P7JxY="
								"data: charlie":                 "3OKec+6VubP7l5y43L0r+Nhp/KJdmYSUsdkPsqBGBjo="
								"schema: CUE":                   "Qf4NURHLYT+4yZ54hU/NCOB2tQvnaJBaDVQGYMzZ4lM="
								"data: bryn (fixed)":            "nWs5Hza8XBbCqLhoHaQrRjL5yaBitPOvKM5Yo95+I9k="
								"data: alex (reminder)":         "krj7ETP/Hes1xzDDmFf0oeSn8dRGfNML7MLPM7b9LPY="
								"data: bryn (reminder)":         "p+rPjUH9vQds+0c4E+Uz27rNacTGEML9thH7jR8b6fs="
								"data: charlie (reminder)":      "9bjIhHi1Hk6sG6iw/CkRTRUYOJFKkyDSPH0z/Y5iLCE="
								"schema: CUE (reminder)":        "fk/7OCND8cvX68hBZXaifR/3qd71Tg4lLJy0B7gam+A="
								"policy: CUE (too restrictive)": "SuDvqNCdDMvib+rwdzuv+MwdnnR+fr3o3S2TyQ7uGlg="
								"policy: CUE (correct)":         "E+QATlq5wcfxqkfFhhx196RZ8a2z3/K/03nMVrOEcyM="
								"schema.proto":                  "1jYVRnJwPgcvdUEllomMRtdelCoGAGkL0x+se/I43TI="
								"schema.json":                   "Ywhm1tHQWflZEFjlfq1qLf6vF2PYed/oetdmqE7m0RU="
								"policy.cue":                    "XMw511l9tpoXB+vf4DWqfmTR3B+2ha4KIFpODLNOS1g="
								"data.yml (broken)":             "Y2FxcK1KsWrBwqwHA3XQIN0WQYTuOCdrIJz4M1+aeaQ="
								"data.yml (fixed)":              "Y1LYXzzSO3wanZNO3zyph/+AaFgDwQ0PEvPJfgunKNA="
							}
							code: {
								constraints: "oJiQsWiTHN7HWeNE/ner+AdSA75L4p6r9Ns5Z2fnF4A="
								definition:  "O8l0Ndrd4RU7VsVYODIXu97rNVabE0qXz4t/qy6+cEc="
							}
							multi_step: {
								hash:       "V2H4E85QKBUI4063EULRBFS3FD0J4V2677C1OJV8OLHH946JCI80===="
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
