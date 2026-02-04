package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Bu+wedTiIOOqVSNkU9QfT81bx7rZAVzTvhEGW1/onRk="
								"initial x.cue":  "VbZSMtD/emISj8ZiI5GpZE7sqlAPMBEALCZU+y5SDA0="
								"another person": "wSmDrjEbHfcDteYn9GsJ2qcBBFmhBsXS9NalF06bAl0="
								"fixed yaml":     "VWZlpAClEuWG3x5X3VOVJc+7SRmiZXK5GyexKoq2IH4="
							}
							multi_step: {
								hash:       "FDKF6P7RGIOONUA7I0BGDC2KGOURSPB4745UF29QSNH2N4J4IC90===="
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
											    ./x.cue:7:21
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
