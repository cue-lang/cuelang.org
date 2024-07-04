package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "29YPIvzZ7y7sDHO1Tj7oMRRIjR++I/2K8dQf4wc+WYE="
								"initial x.cue":  "2Z+PYbjuecPrTADycMHQ1YyLlxDIDOJ+ZJV5Vvl4mMg="
								"another person": "UgWEpIuRiKjAW1h8wZY+3GWAasRyw6cLEQVHN0+3O2c="
								"fixed yaml":     "sNC8WsBEmDb/0vZAXKZCseW0rB5+BLn1fPEpFB7HXqM="
							}
							multi_step: {
								hash:       "3K2AB2T9O4I7NTL8NT122O2R0UGA9E9OAQ7H6QUUKR0IJO4FBJC0===="
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
