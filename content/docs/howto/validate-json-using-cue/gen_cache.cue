package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Lk1lwS7wMQqGfn4SWcCIKgI72oPL+9e4MjAsEzzWgIY="
								"x.cue":        "svIQx6kH3knB8F4E4KzHqgu2FvN0vxtMBdbA0oJ/ohI="
								"x.json v2":    "/P0om7pQyoteRQ8ywT7C5SaxN8y3AT4iREZ3Cc3Epno="
								"fixed x.json": "bNoxc0bd/EyL0pg63zQijZAwP4OIQWO14Wu82xLyeNs="
							}
							multi_step: {
								hash:       "V2E1GAL2N221QV7PI1DVBQFGHB5RFO9O0SK4OCFUC89UJLP5H0RG===="
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
