package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "d571LoQLdVc7+bORX/uOuw5wDf6OSAn9T8U/pDL+56w="
								"initial x.cue":  "iVdvvW6oc0PniqxZa03OOSzUkC0CTwwh/Aa0wZ371gU="
								"another person": "F1tx/0fV70Uch64VFLvW5o3vZadCRu8kum0kRyHSTjU="
								"fixed yaml":     "GkMLLapAG+KIZxHJaz7F5/TcUDdSoFj/+X+xcBWDAVA="
							}
							multi_step: {
								hash:       "A9HS2GQ14RIGOIJRQLB8H736AQCNMEF6GKJ6JNGO0RG7HMVQRN00===="
								scriptHash: "EPFQ83TCVCEH804VFFMD7GUUEQRGQJI79DF5PLIAQFC1KBTV7VJ0===="
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
