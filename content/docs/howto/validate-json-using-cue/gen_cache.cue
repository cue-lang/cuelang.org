package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "OXJaEeasM2uoeCXxive8Bbxe1VjiKSxonJHM7xBuMqw="
								"x.cue":        "F/cVGfq4pVQkCmoCEMnrtwlcRHyy+a+PIIBe8NAxqn0="
								"x.json v2":    "iZSqdyv7ZJIDnP+0RXnTGP4w5G83Ap3FMjLWdtJjTzg="
								"fixed x.json": "e1mMdLOdpLtlz8fwyl489IYKnkBf9kMShnnr9xU2Z+Y="
							}
							multi_step: {
								hash:       "A97S6E92NPRADQETOPQGUNUMQPCI0TL7PNNURH63CJPF6RAITJIG===="
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
