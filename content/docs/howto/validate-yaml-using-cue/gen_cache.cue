package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "RQTYjrzPEJeBE0weJzqn1J0VfiS/xfuqFeNd1g4eVmw="
								"initial x.cue":  "28N9+9u71yTxXc43zjnrcCx50/zBIJQRj2I4AUHL8gc="
								"another person": "9GehielIBvk7imN7JtQ09LAsjwk29VQgj4V9FKAT320="
								"fixed yaml":     "6E9+oXoMmzpDVWrh/Psfaqs+FQt1cafjMs7ooO8olnk="
							}
							multi_step: {
								hash:       "S4K7U49V8AE6N78H494UQ1DCMB97JO8OQ8JPKJT38UN72OI0V9JG===="
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
