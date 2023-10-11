package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "WC6cjVDu7CCfSyo3DpS30A4cL/6pMuvI2qannNjKyzQ="
								"initial x.cue":  "/lsDVBCOIauG3a7KOd1L/vYPyqLOlSiPZUhHzPELWUA="
								"another person": "pY/cjEOwg5QHhaioUQ0MbiR/eoYzaDEKFUkrL86kKWs="
								"fixed yaml":     "vAF50x62H87QTucH/PQkVkDRu6zkoVhjNWN14JicAOY="
							}
							multi_step: {
								"8GDLVFMGAL09J6G8QTK1E7C1F84GGK6354NSPOTSQ871A68RVDUG====": [{
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
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
