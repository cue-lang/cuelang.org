package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "aXIFuT7quOAWeVmJfFC8cNN9Dxoorcz7fnpsC0D/2ws="
								"initial x.cue":  "JpCMH5uFmr51ccytbDISOI3eZnvKdUUPr5ZYCMEvjPw="
								"another person": "3Uo33vK43g7MRQDLO9HggKlFJtA0cgMvUrufUm9xohY="
								"fixed yaml":     "EMvDbdM6Vung1Cxt1pwWDOUHMz6A7YPxLhPSrRu+i2k="
							}
							multi_step: {
								hash:       "B2356QPKS9418IIGQP5L0J380FDGN6KCHGVN42COVQ0SM3BNL4A0===="
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
