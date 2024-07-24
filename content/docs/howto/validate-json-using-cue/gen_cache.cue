package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "i1mgKfycXTH9KlNrU3YZB9t4pwSrCWAJyBO/DcmdnOM="
								"x.cue":        "I6gNt8jFipu+rpfP2UR9dQv6HfmiTy0RFwccUkQeb/A="
								"x.json v2":    "yTugyozoP6QoU9vveWrXR1lsE3EEQ6J4TrGKYSSeVEc="
								"fixed x.json": "RPjYtcXMIbfFsXo1H2MB2uYpkygNdiGppoaIHtRDuDY="
							}
							multi_step: {
								hash:       "IJ79LG5TMPBT1TPEFUDQUPNMIPPGGRMM4OQI3TBE8QCRNFI4FMSG===="
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
