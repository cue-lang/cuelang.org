package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/hRbndxrQoz5VElm6rC/4yOCQt3KXrdLOFi48FKHsVI="
								"initial x.cue":  "3iQHVfkP8FCBuCHoKjgztjH8WcMPT9s4OE85p3Scb+I="
								"another person": "RQktTSTBVIxd5gx2TOfftHIg4ZfErlvLQmdM+9wbWPI="
								"fixed yaml":     "nTmmlYetrnLLrgXtxsFJ/9WyGfa4r6DHNLUhAnb1yc0="
							}
							multi_step: {
								hash:       "DKK0PMJA4D8CLOUSHSFNGO7SFOO93AES0RVV6KAHKH441COLNTQ0===="
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
