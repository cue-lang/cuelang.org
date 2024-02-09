package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "gTUcMe82TToQmSWi5w66NpHTmi0dHRkG7XelBt+R7vo="
								"initial x.cue":  "eqirSgyxRsWmMs6kdhSX0yBRMY5F1VED+sGsc0cXZY0="
								"another person": "7/LcBAFFT/CXdRbyHQBwBnnTacr6D2GWU9nMwsiowQE="
								"fixed yaml":     "12WKKGc3ilxE7buaIcGWu81t9ww+MJB3gKQrsyOHvSw="
							}
							multi_step: {
								"3AR5H43OLUMUG3Q6E6G3VIAQ70A0IK10TUFAQM79TN5Q8BA77RLG====": [{
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
