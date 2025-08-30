package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "9Ys3yNluhf3RHC5LYTSeLYYelZzXA6ugG49XkL07MS0="
								"initial x.cue":  "b0eCsQjBgAwNmEZ6CLWH1Bx1xQaqCNIgUwySgZ8bNMg="
								"another person": "bJLVBFCUcwjGFBHeL4znlkoaiev49+zRbcB2tVyZoQc="
								"fixed yaml":     "Uh8xSnomRAn2Ye5arfoXOvDey2d7PalfcxRKW1b71r0="
							}
							multi_step: {
								hash:       "GQ6Q7UP97SIN25SG40B48R1740VSDBJMOHURH42JT6HOKPUP8BKG===="
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
