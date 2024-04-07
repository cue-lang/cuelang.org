package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "SNlICmOKoQdsXrHWfK97xGTXRXhg/DWMhcjfYapNbdE="
								"initial x.cue":  "sGfFr4+pxuHLhjWM8LXrQGLerQ5w0lr6J+7uagtU55c="
								"another person": "Itm8xLy3032RZS2XObbjHFqP6DT5osggozIulRf5JgE="
								"fixed yaml":     "pWUjpoKC3aQVfL2X+THc+XTM9XaI8yppq1BeE4PJV6c="
							}
							multi_step: {
								"8PALGLO6BD01CLBNDQCJ38QE6A8GH52UBBLDVP94F16PLA6UDJ9G====": [{
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
