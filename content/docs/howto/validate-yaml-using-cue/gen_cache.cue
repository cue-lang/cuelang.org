package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "+LRpGHd68hG2DsgBPeinPLeQO/xHA9XDJXusKWt/DGQ="
								"initial x.cue":  "EPcLBDkpk78q1XohbHOcT1SEP9l/K3scQW5hFos8rss="
								"another person": "mfKmau68CstofiztpZonkcCOUdXAzkcWIZnKjk14Pto="
								"fixed yaml":     "Cyn8ZvLZrOGd2dNDTgNuiY/NiUFwVK6TJY6QWjWt4pI="
							}
							multi_step: {
								hash:       "QIBDJMT9SSP662T45H67189ATMCK089M7TMGVCDJMOPICBTS6P50===="
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
