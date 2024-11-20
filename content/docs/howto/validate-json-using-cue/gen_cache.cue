package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "VYD3tqghJYDTBHWcNPhYlsIM+GfVKuu5KEYfIggUuWw="
								"x.cue":        "1oNJpT/uWHhn2sFvxugSjmKFPmOjgTA1fA/e+z46uf0="
								"x.json v2":    "D5qFsfVDTqJ4AJezu0tO9VyJOaTcDDMGWX0RWXlC2Ho="
								"fixed x.json": "EY7rHNLbcOQMGp/q1OayoqpVxEHueA2wGWlO4UZifZA="
							}
							multi_step: {
								hash:       "S3D0881B1Q6DHACO42KLN8OISTRCHDCLNEHQQ0EH5R12N833SE1G===="
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
