package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Go/Rw89BiImq1JKrgnQ3qUtWxqdaL6PRM63E54oRhFQ="
								"initial x.cue":  "KkiFjnlQs0QslMO9IoP2GIq6qlmHT8w9oA354Y7ui3Y="
								"another person": "pn/9zROUnRWqeAhwVLjP/H7UeNrKLZNsgj/n6Wsrb84="
								"fixed yaml":     "ZvDK2FZUyIAOKNXYw4R5zo5RH5sI0Ii9hBAL5ArfDxk="
							}
							multi_step: {
								hash:       "84MFKO2HQ08O2TOM3I8GNAIUMT65ENT4TB3G4QKU6SCQ1AS01BJG===="
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
