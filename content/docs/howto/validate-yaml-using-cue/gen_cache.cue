package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Hym6XF8UEm5BT0BVpUPEoM3CrSGyI7DLn8xghbgY2yI="
								"initial x.cue":  "Txv3CD0x+pGO49sFyOGbIWQLUdt2RXrwMlq/iO88mpk="
								"another person": "4I7nI3ArynE5IKJqiW6hrYi13+o1KHhvpNHbPYvOlPk="
								"fixed yaml":     "cLs9OS4kMxrpXS7C40VLDEu7YqeQJLOtDM6IpCo1/Nk="
							}
							multi_step: {
								hash:       "PMV7V71323EENUTV6TMTV9OAM47FAALV2LP99E658904D54NRSUG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
