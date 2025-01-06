package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "wEl5+PlCUrA3CDx9ZDQcTbyupRZpburmp5qXUD8Msaw="
								"initial x.cue":  "QP4bEy8K6AFhMPhXuLelzR7qCmsmlx6tw18eeJOClmI="
								"another person": "9jA3rsV4WfY9AktT84n8VTpwvvBS7ZUF+pvFpktffwQ="
								"fixed yaml":     "x+aXTqAC0842YjRJ14htr3njJm02fEp2uRG1mZrYnN0="
							}
							multi_step: {
								hash:       "2NRK1CSQQT5EDMALA1GLRG870RPV44RVU4R9KMSET4HD81IBG490===="
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
