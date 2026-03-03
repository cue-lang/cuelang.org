package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "0xLPBrVbnDKvnH1vm9TqvzHbXwpTc25D/tUWg1zySR0="
								"data: bryn (broken)":           "T0MppHipVre7T2iHuCBd5LWaFUCs0aX20unOriW9nMA="
								"data: charlie":                 "jDBMueFTqp6ZFW1mwv7H8eXbaztxRkL2tTnRHLbJc48="
								"schema: CUE":                   "mAdLS7KttaYrXvWM71bw/Nltz/wiPKiufaUud/0Azjg="
								"data: bryn (fixed)":            "jAq1Wy3A1DXhsa5T9X6M3WGQuzQ8nhEEXyvvdyLdd1c="
								"data: alex (reminder)":         "UezvFeyuRrCaEJbEoBk36F27oKvNoxYgoWEL0VsiVas="
								"data: bryn (reminder)":         "XnPTs/4FwzIO9f+VqhaQH8yOTH5dNcu33AmXe4W2GDc="
								"data: charlie (reminder)":      "WewC2xQX2qHbw/g7vDJFCQnZ0u3xG3PqG30ENGxYxKo="
								"schema: CUE (reminder)":        "YFNYwQ7VnTNvFzpz2iKqPNL4kE4Yx3+1Pg2XTLvtJQs="
								"policy: CUE (too restrictive)": "dTEgavfIIQ2LUKmPLo5gVDTWX1KJROZbpMmocDA0yio="
								"policy: CUE (correct)":         "2Oh5NmIinp9gyuh76oJKCwtaB72XyYRJm5fsFFZaYvU="
								"schema.proto":                  "dlGsChTruECQPB4KPQQvtB5RE1WZTmLU2QiHObuRTqs="
								"schema.json":                   "1vppFV9fNZ6sYouHs/LE1sH3xZHzuoA6X/UO1/vPLYQ="
								"policy.cue":                    "/Le+wOU8qsq0U55LSs6X58075ASj/m/ELNcynVN7mlk="
								"data.yml (broken)":             "exK7HpVNki9sjaXfHY0UY55N6heDVe4DQNIZMO3V1ao="
								"data.yml (fixed)":              "Oexn3G1q3oa8+NOFkjtoy4GiTwElT11gPWocsnly0+k="
							}
							code: {
								constraints: "4kPNwqSwdgYUhigB3PcaW5BRudmShE3Ovv84K6N9OhM="
								definition:  "QH/DH+/Se00c5EODlCA90QzSVH64O//hwsSZCTOpJjg="
							}
							multi_step: {
								hash:       "5GSFIJ9FP72K9DILIM1GC8GLD19L3DRSNN5IE2H29BQJSJ9PH2N0===="
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
