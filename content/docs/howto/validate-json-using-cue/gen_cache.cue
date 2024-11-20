package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "s/Ig99DAnlL0Ndm1XtW/idpWYV5YoNjC44MVvSSBLXg="
								"x.cue":        "4pCXdUSiHbDeCEtKHKZuhPtNaAKaw7Xra1tm8Bhk3Mk="
								"x.json v2":    "1T6CMCAcpzH7aXnCSAF1L2moDQe3OVblnR4KErUWat0="
								"fixed x.json": "2hZKLeA+XamEwTeqcplyL+VqzW779qtUydvq9nn0y30="
							}
							multi_step: {
								hash:       "9MFM1AO8O1L036IE1SQFRNGKAQT2IF8LEGVQ0JA5O49ABEM48T10===="
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
