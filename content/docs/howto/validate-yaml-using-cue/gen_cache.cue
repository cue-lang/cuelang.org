package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ZPg8QTHm34zv8pyUS4IGsflRXgh+E2U9N7NsbeFdpDg="
								"initial x.cue":  "p9LiTBBYOeZ5x/Bq7dYnandRRSD0oxeReIh41qsrujI="
								"another person": "NewHhbbHJNo0KP6rtBDflI5NF3Li9IOFCUi4rumjNCU="
								"fixed yaml":     "Bb08B20Srb3vwRskxSxpM0c9e8AamxAPNzrHQJN21Go="
							}
							multi_step: {
								hash:       "H6N5F4TTFNKHD94JOQOCEGJ5BKMKM7FLTIC2SM10863FNF1II4S0===="
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
