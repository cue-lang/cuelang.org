package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "LLREP78+r9K+H1QCMppvYJ0NtJpG8lL+S/ATmjyy3vc="
								"initial x.cue":  "ajRMBOEEcHcEl8S/04Bh37k31d6saMfEx2cyHA3Kq+Y="
								"another person": "AHEo+vd9dwj5BelMJF8b+YBpVeQDblCom5WXO3oDai4="
								"fixed yaml":     "kGN4vvMxpoN5mXhrYy+18FOVw0xQ5KnApiTA1beN6Ko="
							}
							multi_step: {
								hash:       "E5KO7HHQOCGB8JG5T9O6A991CM94NMOJS4P8BO7NDA0U119DJJUG===="
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
