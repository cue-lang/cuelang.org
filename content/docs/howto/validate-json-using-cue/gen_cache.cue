package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "MluAFez588rg5RyrOvVDHTjJ7UBJMuEcOultPZlvOTo="
								"x.cue":        "cHN7TkSSVljPz6DSRWED66qglcC2/BeOpegYV24rhy4="
								"x.json v2":    "Ff+Rev46g3DIgkFn4NOgZUNzop3c3JRufq4rdSrWto8="
								"fixed x.json": "MWjcKhtOJy1AXe7ffOL9gbpXuGzTTZMGE76omA58QWc="
							}
							multi_step: {
								hash:       "U33QT7KAQPT0SLKNHHVP5O45SUV2DFPK94J2NH9T2DE8FFHFT0AG===="
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
