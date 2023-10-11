package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "qSK8+ZYo714udduFkr21+VVyvkcPbeVckqZIh60bBPM="
								"initial x.cue":  "ZGA8+gfyE+RWIiwnkNOFg8byvl0nJZSZWvQIt0PZNjM="
								"another person": "hCiineVfdIgrKnSIb5/v4MxoNB+drxwoUoWu9+iz/KY="
								"fixed yaml":     "EZAmud87KlN/Sx32nZpPM1IWfdh9NOiyM0SGi8tEVA0="
							}
							multi_step: {
								"UF9J9SCJJGASBI76NS0BADSFML76K2TIR7MEF1N2UFM2RE45D7L0====": [{
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
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
