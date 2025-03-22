package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "xBH5p5byBJM0EXCAHb2Z+2f52AMEAbPkt/AD70txsec="
								"x.cue":        "VxHzzlbFoVlqEarAV1onXpx4mRgl0p5RAFCtAtRrxH8="
								"x.json v2":    "TgdmULWl6XBXuTK/vKDFKpxZReWYiy8rr35Q2Q70gAs="
								"fixed x.json": "dm+fM/5vhRV7fID0GdpXUy9fmX58agS7LSwu4s7fX8Q="
							}
							multi_step: {
								hash:       "E8SSN6GMSCFVU9E6GUTKNGFPBGNNL72592HD4DJM9MO6RG358EJG===="
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
