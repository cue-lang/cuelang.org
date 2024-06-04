package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "er5W3IBX/ezNaifjvIbDq1ow+2Y4lXO+HgYau8OlMAs="
								"initial x.cue":  "LdYE0GripGrPYNdMAhJI4Sq+vzxDu/YEvnjWMZnXpnc="
								"another person": "LkqlbqNrrKezXKUNylB8daqZaR7tTbmkYUy/KZWjzZM="
								"fixed yaml":     "BKXyESGf6jHmzYp91rFB1YXjOrDMu5IKr4XlKy4n+6E="
							}
							multi_step: {
								hash:       "PKNDKLNN6BKV8PAARA251MI3T2N8LMISC9K1OBUKRSM69O5HNTN0===="
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
