package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ByG/MzfQgecRiM3jbDLiPCjCNAU5gd5YnGrSaQP7RY8="
								"x.cue":        "qxNFsEbdHhP+eAGpPZqqLMQiXYMPGc+5WTc+kciBd0k="
								"x.json v2":    "DhWZEsc7ekxlQaC8GXByGq6SEd5cgaa3LVgftesr43Y="
								"fixed x.json": "xYXDrKfdVEKi/e0BfdjCQP/DFzG22HnOss1ioXsAK2Y="
							}
							multi_step: {
								hash:       "M0Q4LFQI4T2BQQ93MF9CE0SPPF6U4V9SIA3JLR3F52NA7QJU1OI0===="
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
