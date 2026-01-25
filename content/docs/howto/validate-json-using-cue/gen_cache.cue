package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "khOvU3b6x/QxgQMJAcS+2P/CLtngfHMeLHwHsSma/ig="
								"x.cue":        "MYonUcl4FybqiPC4Tv+6+s+PcQ/I+vutmfnCBUtUFB0="
								"x.json v2":    "v91fS48xXdZT+tIULLrbjkJ1of6Kw3G51nY/uthjOiI="
								"fixed x.json": "FxqOuCBjL+jk7kfFRuNqC53uWbafZmZx0gobm2NOVUE="
							}
							multi_step: {
								hash:       "81P5QR25NT0EN05VUGJSK6Q6F9LH51CJE2TI4NI6MSO3INQGUCUG===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
