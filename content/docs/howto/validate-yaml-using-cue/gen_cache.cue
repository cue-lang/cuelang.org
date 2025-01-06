package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "RvH92oyDdYMpIxxXKMjKfro9OzsuRO2kYzm9bdv8AYY="
								"initial x.cue":  "4Xwa1VqM3jL9HLz1BWx/fuG+OIkHPFvMN1rFVW/w34U="
								"another person": "VmAXoK69GCU3txrN2X1sof9SDsSVwix2oJYO/tZJkFo="
								"fixed yaml":     "7mBVIRbjT5Rbq3uS+eXveVhqrwHt9TN7yT+C68+BO0M="
							}
							multi_step: {
								hash:       "L28UV9P485IBFQA4PCJVHUQ6S1GS4N4QU56JFCLAUI0GO0RA99GG===="
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
