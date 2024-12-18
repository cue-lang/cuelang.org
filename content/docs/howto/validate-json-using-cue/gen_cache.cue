package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "04gu9/8Idk9TdXSY945F3qBwSUtTXwzk9gn+Ym8VybU="
								"x.cue":        "mV950nOMXPtXXFwwdsqbG7M9ARBxe5z6Y0mPWINfoT0="
								"x.json v2":    "w9zuOruh02uRNmCBxwtA22NfK66XbkbEQi1cY2/1v/U="
								"fixed x.json": "D8FBFYDc4bJ67YYbXj5hd0kx4hHgsQ9F/rJGUP4SNi8="
							}
							multi_step: {
								hash:       "4HPKDLCGIV1U7EKRMMUL9QD4HHBA4HU880T2NCB0VBFLTVAKN3HG===="
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
