package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "qpU+Ki7pK+kfqeNiCSyiVbCIkP5+ODcC0jGDKKpW3/8="
								"initial x.cue":  "slEMxdooB5vuTbEPOOzbJVc57DqEe/r5adWeyeMD/KI="
								"another person": "sKWmuROrdi12swloWwRMGw8UIdNeWbBIrM8VtHxFIpE="
								"fixed yaml":     "LW8XXG0Zxx34fOJKl/wWeeurs5pIuHWobVNhw8jcqks="
							}
							multi_step: {
								hash:       "5NDRDLQ54ILH2CPF4QKFHOD88SFNOC5GQGJKNLMGOM53AGRH72L0===="
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
