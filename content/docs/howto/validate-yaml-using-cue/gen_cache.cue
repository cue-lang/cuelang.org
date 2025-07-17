package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "XK/Ln1H4Q2+KaKrJzEDHjsHQds59ETRhp/p839n2R0A="
								"initial x.cue":  "tjj/+6lqK7nn6/IcCFjef2E1DxslJnU4HL1k3yktyCU="
								"another person": "v0HrrwFqS2nnjC/CTsCDx44UUjdhjGRWVgCMX7AAZK4="
								"fixed yaml":     "QupwdZTtesSr9V1oCAKiTJyzkDZpKAoKIWjuLP8THxY="
							}
							multi_step: {
								hash:       "IJP27HPKLUJC3DMR5B66SGHSHFLSNVLDMH5LHASIRG1MFBVG621G===="
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
