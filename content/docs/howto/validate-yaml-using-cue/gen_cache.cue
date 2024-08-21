package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "mlrBLIMZcz6OoxWlVF2I0mE2XYa4Iqq1PmzbXVaMWj4="
								"initial x.cue":  "MscXoZk9OyKVaSFdurwz008n9QoCu7t2CxXScN/uLSg="
								"another person": "uJ59XKeg7CW5ifXE5/QFXZcVxb9qprTII/ds3+ljNxw="
								"fixed yaml":     "SbqmcZc5/oAbOOps8HbBXXE6AUZIE9gbCBKMFDmQEng="
							}
							multi_step: {
								hash:       "HF2A969KVHNQMJDQ3MD0JC86GB1KCD7QU8RELPLDSEQ4JPLV7TU0===="
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
