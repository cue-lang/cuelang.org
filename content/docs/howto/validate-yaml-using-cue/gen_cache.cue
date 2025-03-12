package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "OTEfC0YK/kNpXkdSo/zEhb42b815joi3kQH6Lrbvs0s="
								"initial x.cue":  "b8+mijMliS9QOG5hiW+U8z3Nm4ZBfhTlXLq2qFwe4RE="
								"another person": "jOzipmbfgmHGjqhWE6uIW9gfAeGG5pIYEU4fNCx8AQU="
								"fixed yaml":     "A81iAznv+ts+WpmPB2jfNX2dF9UTtlBlxQtWL2NgtI8="
							}
							multi_step: {
								hash:       "BS6O0RTE61M6NAVRPJB2583FS3Q4O1EFGRA4S3QNOPJNHL5K75OG===="
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
