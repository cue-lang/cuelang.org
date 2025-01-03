package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/k6/JucIxxnMxZP5tI4LKGTzjvTnxlwKKGX0Ij1qGMY="
								"initial x.cue":  "8nJHKHXgaf9N3fh4Re6684oyc1Yz2p7NjpXQJWTus90="
								"another person": "LFQqW43rKfwCiH1Vbf4uvzT1Kh+H730BmDt2hRwzSW4="
								"fixed yaml":     "ayxdJgnHQMs2eCdyJ623u1YsrbsvLx3BNoIyTItm1Sg="
							}
							multi_step: {
								hash:       "396CCK83T5J0O4H1MUOKRNU4LGP9TNPPR460RKLTOVDQOGH5CA60===="
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
