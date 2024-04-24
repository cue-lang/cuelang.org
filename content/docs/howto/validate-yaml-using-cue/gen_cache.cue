package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ppwdAz7fDmwuG+MtANzRdaaix4mLHdBc7rwPc+R9dbE="
								"initial x.cue":  "3hp/gHsZpmVnaCbhPCQTOtiwZjaChcsS6tmQvxt/9CU="
								"another person": "XXQk+DWRo/ZIYMpTEDyiGA9+gGK/3n1m+iWMS7yub30="
								"fixed yaml":     "GsaU5w7MwGL08EvT4dcYt9AQTf79gxHIlqgTz5jHaXM="
							}
							multi_step: {
								hash:       "5GRGJDE9F85LFVO7T6MVB9KBHVEIQ5A6KKDLTUK2FM6JGBPFE62G===="
								scriptHash: "TKKU7JEF7ORT6L9TSNKD9P5J1GDTFLS2HIE28N6UHD5PJ68NL0P0===="
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
