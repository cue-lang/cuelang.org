package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "hHY9LK8OP+rwZ1qF1V5wqcmz2ctAhVu5S8BDe3kHPDI="
								"initial x.cue":  "P9avbqQTaFdeDew54bicNCs88fXXz0bIT64yf+lPpCo="
								"another person": "hEjOWQt8A5Lu90plYLBm6/nDF0nnIhLgK25eufTMnUA="
								"fixed yaml":     "EP8xTcZHoSs04O33NuZAwn7zt3hianFSCyCuRuQWWG0="
							}
							multi_step: {
								"AAA0D87E9OVS5QD8NLFVVCENDPJJMHECU9ROBU8QSD792MSCGI00====": [{
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
