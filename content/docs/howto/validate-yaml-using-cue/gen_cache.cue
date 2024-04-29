package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "+YeaE4fdcL8VxQ5dlvLmtPt+JjnOGVqlm36Gn/phYvo="
								"initial x.cue":  "5/EQ7VUmmDqCr3MS7+PgKX3t2yGXS0PZmaZHXP7n/0I="
								"another person": "2eM86w1OkoJ1OCQUIbuBU0zn1ufZ1kQcadsGkWmX/8w="
								"fixed yaml":     "yC4Y9DLCyShOM2AgCwHXaJKFxWGOO3jgRsMhyx5P0w8="
							}
							multi_step: {
								hash:       "1NBBJI5HDMO0F3ANDMCPCF2JD504C80J506PF5ETB1RE5JLSEUH0===="
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
