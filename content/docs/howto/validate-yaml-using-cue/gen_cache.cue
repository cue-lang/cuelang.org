package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Fo8oAoE7G7yaTwyM/yUdb37Xnjl7iSUG3ExtKawvvII="
								"initial x.cue":  "PgVIBITRFbfq9CKkvLxOi/5brP9oHLNXihzhMzXAZ2g="
								"another person": "OJsPMImmc052AHX8een7KpMlWviSIZs47RG60Lz1LoM="
								"fixed yaml":     "vPMpe1TzMg1tWZk1VzM+AreeX1H8myAxpSAk1MHms0o="
							}
							multi_step: {
								hash:       "FPF57T6QS5PDRVI5JELDQC0G6N8D1M56JQ5847UANRKLJMC7FD70===="
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
