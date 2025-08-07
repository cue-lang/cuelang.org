package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "I8Vm9ikjgxw9cG4tYcFxgLZD2iSEtL4oCa1FYFOid+U="
								"initial x.cue":  "i35QByfTwyzptiGumTsWgYrMxAwLj+nAnf1Gn+IwzxI="
								"another person": "ZFBlXLcSPGdpuLVFOSktPFXeMP7lSjidySTiHlhGCk8="
								"fixed yaml":     "CRhqvrAe4yfVZvc6V33z/FPG11Z8nxbbhTDKga8/SMI="
							}
							multi_step: {
								hash:       "DAHHMQ1URRUM1M8NQC8L5G5LLTCDFVTKAM2RJ5B18MMG3RGDV6Q0===="
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
