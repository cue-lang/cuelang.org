package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "LPapQ/Mib/oTeGXVQ0/FjpOXPYJBzLjAKrPuBjbM9Qc="
								"x.cue":        "I27gaSj6WU1HeaRHasSbSkhK+KnLikDSkc2bCztja9w="
								"x.json v2":    "ZndeoOLJ2nu4ZjaBpXJ86mQi5PyL7oeH3q60yXK9gKk="
								"fixed x.json": "t9sETYhz3XUKnKojSnS2W7OlglRN93sKYbZV1Bbtvhw="
							}
							multi_step: {
								hash:       "JGU4TD2R6LCGVOAB0K8CI76EAB092QJHN7UCFDR1ADO50JPDV9DG===="
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
