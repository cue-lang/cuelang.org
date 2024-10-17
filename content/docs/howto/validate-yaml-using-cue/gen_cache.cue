package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ufvFdQQi+pKBYp8Q/Kx8NC0QgHdkkuJAcGL0Y633vGA="
								"initial x.cue":  "T2pnYGen3zcF7NkgkGYwqz7CTo54e3AEyv3GMH48vlk="
								"another person": "vK0+2Yo5lPaQP8I11Vxq0Iy8CQ+LdGGIsfUE/ChqMwE="
								"fixed yaml":     "+wk2LZBvrQCpcviWxAacJgokFdM+7PvL4YWh8slDJ9g="
							}
							multi_step: {
								hash:       "TJFVHF2M6BVHE401G52E0FML0AO4MLC9TTNRG7SR08TF078BD4D0===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
