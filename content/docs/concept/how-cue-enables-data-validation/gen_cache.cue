package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "G05dhVbHm7SGEHP9d0azAX9H7p3jhitH6rtP3zWh/Fk="
								"data: bryn (broken)":           "TTZA5UDyqu4Fdm2jhhq8yIlCSHsc6zytM2lqqfx/Yqw="
								"data: charlie":                 "xJ4xHsAZkiTTtlZ7X9gtBng4krHdEREONF+uB7T5eJc="
								"schema: CUE":                   "S6cZxmCv6E4anN/NuK8CJb2+XeGbNiPfp683hACR25w="
								"data: bryn (fixed)":            "GglckvHNP6PaG92XkS/bWVCCu5PEyfd2i2iOjJUg54c="
								"data: alex (reminder)":         "jKYrMiPm7jy7TbKB6oS72dL/xmCZ4pqsrj8u6dj/2dk="
								"data: bryn (reminder)":         "kKArtB8Oq6bjb2RwLtlRJ7fz3twnfvihFjybAf8Felk="
								"data: charlie (reminder)":      "LhP6CEgqM9+R9fxLEaZmbGqW9BqIa3pgZ+3QxPhBE+Q="
								"schema: CUE (reminder)":        "g7l2GcAivYzQyR90pFY0AmvjeD3lpt6R5tJ/Pry15xo="
								"policy: CUE (too restrictive)": "GNkpHwsQIEqKLv9U6yUK5vCB1HtGcx/DoB9Y5EKsakI="
								"policy: CUE (correct)":         "TS/mc6KZiag7it6osBxQQhsOPgHRU6csgVqAX31wElk="
							}
							code: {
								constraints: "g+gfYILhuBhwr4lUXMZkWtyytnnjTYkvifuKMry61AE="
								closedness:  "/yZDQn57nRXbsaATfK7cODywKFhvn9u+lCN1G9x3upY="
							}
							multi_step: {
								hash:       "OHRO4TS977NSNGIVAQOTIL39RJK6VGFG47UPTCQ7DFJV22QB5ICG===="
								scriptHash: "RCGA0FKKGKN9J39FO2PBH1U2CQIH34CTSOKFVE276UB82EAAV7RG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet . alex.yml bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.yml bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.yml bryn.json charlie.yaml"
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
									cmd:      "cue vet . alex.yml bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm *.cue"
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
