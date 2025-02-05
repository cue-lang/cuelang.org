package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "RcpmeDqcyTYBgkuvZsfEcXX1zJlDMDzFwZ8aZ6Ae88Y="
								"initial x.cue":  "wWulqsNcnJOhX51VWBJEplQWgeDSTXsJqPIlkX2/feA="
								"another person": "gm1d+bDVItEiu5GG8ZWEOTVcJY7al0+GAEm9+hf3eaU="
								"fixed yaml":     "3kcnz4iecrwpknYfkc+IMgEYQOvDYObzNwB+Kt9tlUU="
							}
							multi_step: {
								hash:       "C9QL9IRP25F48VSGOQ5JTGGR1QOT88DOFFCERKUKMNM650KGILL0===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
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
