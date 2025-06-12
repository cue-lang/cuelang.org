package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ggQOSOTPhTELTXGpndN274Qnz0l/QdhV/Y3BDxhVgvk="
								"initial x.cue":  "7RLo7dPUjO4EtHYJ71YnNCoLjs09qBUkPJPBflSVtaE="
								"another person": "bUh9AUrGrhDeyA7RQi8rL6lik0991sinoNAUS1mSzWM="
								"fixed yaml":     "H94veJ5XQ2QieHfKT22FeOZgqNNZgYFOYA4i7A0YJJE="
							}
							multi_step: {
								hash:       "M652V46R9OC58RLC5NOSFM0DA28NVRT267NKK97K0A6A1SK0PVC0===="
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
