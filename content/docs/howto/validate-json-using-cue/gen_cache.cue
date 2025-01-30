package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "FZ+qM2xLi4m2nGUqRfRBSJpqLNiIm4a5NyBo7BnQl6g="
								"x.cue":        "nPfLJp0xCNAH1hkxItZcqzyjgfXMPm6FWkPt5iE1KrM="
								"x.json v2":    "suDqJfmy0PE5vBoFj5OEsSEI1Jzdxd+Pz0Zn8jpA4Do="
								"fixed x.json": "PCR9+qF+QhyiZa9qsc8zzOKsaKauBbTGgIFyTOY12u4="
							}
							multi_step: {
								hash:       "Q13LAJ6RUHCA0QP9RI2867R2V7CPKKCGVQR1QBNI837F7NGV6JIG===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
