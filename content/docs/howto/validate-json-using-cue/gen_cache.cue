package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "XUZBZ6Eb8eRZTbW2DdyaoJBZIMWeUqZKqbSfU41sgo4="
								"x.cue":        "it82huTBLS05GdI38xDEE2jDagAAG5nQkL3TWWpS7lI="
								"x.json v2":    "Aaw/6Lwxxu67bGoLa58p8IN4Zn/6/Kx4Pd3T98sYEKg="
								"fixed x.json": "s2OMasRqrG+eIczcYn6H1+q+2JLqKW+3u9LUsQ0p4Bw="
							}
							multi_step: {
								hash:       "6KA3JJ4MP21CFPTGHKSR7SU7S12U8ENALF6TQSHJFNSQNE87BIC0===="
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
