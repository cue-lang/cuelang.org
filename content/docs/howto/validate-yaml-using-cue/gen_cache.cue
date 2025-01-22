package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "R4pR1XwVagI1K8s/u4gz1sxPXn6eKZSvy/CTDtP+F8s="
								"initial x.cue":  "qsFBTFY1eQ+tywd2tB83kNmsZu6mslwkES0rAHUAgpE="
								"another person": "rg+fzH3EBNUXvSIkujhOxcWktRrmCKzchjdrkCFhqK4="
								"fixed yaml":     "GF/M+qClq0wvjWLyHsmn4nbSmmfJt3kvCIIh/W51OL8="
							}
							multi_step: {
								hash:       "V0K0JQBH7RN71J6NHF63RUCEH02T2O2458JMK9V50LQL35FS3GR0===="
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
