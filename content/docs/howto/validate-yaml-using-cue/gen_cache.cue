package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "pfdSuo210lVCI5MvnJDejjpaHtlTkhgZ1dydGSqFtnI="
								"initial x.cue":  "Rb6/JV5QCGKrFjcz4a/Ma7TvPKsn3M4gfJ49s1DJgmA="
								"another person": "vuUXUT1oJ7gij/W42iHq/mIwhmlNNOfp2ddRms4RTUI="
								"fixed yaml":     "hkD2VxsprJxU56iKMtLiTluCEIDJ5IfksczTGq1RfQI="
							}
							multi_step: {
								hash:       "B70ESGNTU2KQ2E1SHT9IH7V96L87DFJCEBI6DRMNPPDEUK02SFQ0===="
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
