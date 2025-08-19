package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "nrKPNdjhqqwoMGlb0iKA04MXEly/OY5z1nReD6jkvys="
								"initial x.cue":  "WUI3AXQdpvJZTJ0gM6fkIb/d49BdWpozedNmgBGauA0="
								"another person": "Y+lT7K+PBksGoWVp4BhO9+iUtrvaoqxK8ihaKejk1/0="
								"fixed yaml":     "xN1jPy2D68pEZ6dO5y7bSUK66NZyrabgPIXqdyF6gyE="
							}
							multi_step: {
								hash:       "5BEHS0PCFCE3KE9NIDM62HAIMD6B6QG11O306LMVVU0GPH0AB0SG===="
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
