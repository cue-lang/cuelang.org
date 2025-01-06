package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "T1xx+xJ24jYHmVVFYqU9BPHZIDuNsAv2hKpe8IDEtMI="
								"initial x.cue":  "/ZwCmE+wB0wN/4vbE4TF6cGw0fJgZQF0jK+B4VtwIDc="
								"another person": "sc19fMzdVNg/XbTHH4w7tZFmZ5a6zfKPyLe8Hfi2gp8="
								"fixed yaml":     "90PPYQqqZMcZt8OiiqjTUiUua4pXJ+ru5ekeWeS8c1s="
							}
							multi_step: {
								hash:       "QQG8MQL7T0L1VK0R69FEA44BM2C9TST0MUJUKL233QMEJQ0NJ87G===="
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
