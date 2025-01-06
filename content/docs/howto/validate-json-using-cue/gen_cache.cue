package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "bX5WJWMaFZYsXss6UYR3/PTjFlNkzobLA5esbM3iQCA="
								"x.cue":        "ypvavhCW0cWA6D9+4LfQ2FFFYd9kqDeYD/Q0WYbPUJs="
								"x.json v2":    "57DHDZPk0msNCUA0CEPJUnLYmN6zZ0VokS8mHK9t0Ok="
								"fixed x.json": "J9sYr3zbbC2RAY5ipxnsjFG1SwDwBD8Co+VIkEtpLbw="
							}
							multi_step: {
								hash:       "KL6BV7VKLISOFMJKQ0E4TOMHN4G0LF98F996B0GH93L4P75INEM0===="
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
