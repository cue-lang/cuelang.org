package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "DlZcPn5Ep0zzZ3qcj+bPszXvEK9I9FrKJmSTyA+FN8E="
								"x.cue":        "pwaeVr/wTaRefJYs4hXQKZ9KtSjwxM2DPXDxLfe2S5w="
								"x.json v2":    "30nRqAmn+xOIP98wGgGfU2Ha0hyc1wcHk9JVX900ZD0="
								"fixed x.json": "iSJKcDgZrjYnXVintOxqvz70RI2QZqYgmuWbQyGFoZw="
							}
							multi_step: {
								hash:       "DHJSPGDPF6CEIJV7I8JGGP9HJEB0LB5QINQQRF5D92FLRHACM70G===="
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
