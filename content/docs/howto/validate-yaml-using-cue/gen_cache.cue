package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "jLfPiTTlP98vDBBtAp97Y7IhP4sSSJYoy3SsEc9G+gI="
								"initial x.cue":  "2MzOSBDCCSzgRmWdyFueKCNJTmagI/8KFDrgeahPRM0="
								"another person": "RaXaGjWNSUaVYUnYWISVgBO4Rnj3dMtRbmGQl253DHo="
								"fixed yaml":     "9j+qGXMDzJ1GIdAmk6zlGLvbg9RBvY5/ixOGPR4YzW0="
							}
							multi_step: {
								hash:       "SD1M9D0ONDV1018DINML99Q0OS6R0MTS2ADU1LL8G3LNJ066A1R0===="
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
