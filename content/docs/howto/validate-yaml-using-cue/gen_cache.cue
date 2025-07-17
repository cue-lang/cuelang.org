package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "bSguv/8ndw/BeZeJ/S9x/5rC9P7Wtze2Y4SLf6DQYF0="
								"initial x.cue":  "xT99xZgZA5XvOdO2p+LySPiaX+4ezJFgDhz9uq70kfY="
								"another person": "mFRfKa/fP8OaANAPX/q/vpYSEbIbOcuf4U/Vnmr26qo="
								"fixed yaml":     "KNScuujZQE5XUaGmLA8ijAc+cr8E8xJY6ZUG9xtXNI4="
							}
							multi_step: {
								hash:       "NESDNF5OGR9JGRM2I3CIC2I17ONRMB7JMFG1HF9R7HV742OH23G0===="
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
