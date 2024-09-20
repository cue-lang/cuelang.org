package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "fUaFEg9auCNOTP3MVYag8k6HePsDe1pg9bOXUnJBNh4="
								"initial x.cue":  "XnRAmR3o9epC2Q5GD3VA9q9lLhZ9/Vkw+qdHenolySw="
								"another person": "uGJGB8eH42hgugpYvzipVbyGVHn/C8MqjSPcGa4J6/w="
								"fixed yaml":     "FKkRTUWnDWVJ6S5EQJ/Liqe+8NqYWc7O28RmJIqdfzs="
							}
							multi_step: {
								hash:       "BDSD5JSG7SLMTL4HO03HCJSD38D70CVHOL0AMAMSV3DDHCNI1830===="
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
