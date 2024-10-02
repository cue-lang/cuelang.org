package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "8h8nkZ1mTBbH2VzR6ycB5h5MOoTm36rdoxLAzG8GCEY="
								"initial x.cue":  "zucHECGpYaLOC9x77PIyrjq9/CFh4Hxlc+mPLfRiu7U="
								"another person": "0bw5XPqPVAJAdh3VxjSSliQPvHZEWMDKpD9sWEGppOw="
								"fixed yaml":     "Xs52si6RxLsp0LpfEgA7DQW1EkjFGCSPnLIlwzXt1Bg="
							}
							multi_step: {
								hash:       "T4NSP61DP44DI2I9TFH8SUQIPUU8FJN7ANBHHCFGJQPUTHFO73HG===="
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
