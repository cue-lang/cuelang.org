package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "+Q0xq+Wy3G8xX3CG6MV8Vql5IIFAUpaqH5dvFdh/PNA="
								"initial x.cue":  "86DnkyeIfcqEx9rTf5VwkhAFXiTIEfNXcd2VsZDXnMo="
								"another person": "UrK2dBA9o4MajGyXRu9OQBQ+f8Tl8EqEEmqP4I+E/6A="
								"fixed yaml":     "MsKo0P038B6PR2JSr0IvS0Uej0R1SL9LPDs7YyxLXE4="
							}
							multi_step: {
								hash:       "2HF1T2I2D21FOVTRMGTBL3CBRE9F57355JGDRR6KKRFI2H037V60===="
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
