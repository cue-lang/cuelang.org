package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "qEIv7z312SkFnHartPPbLklUJU8UjUq2vwqjMYQp22c="
								"initial x.cue":  "qP2DFgj8kPE2YUE6LoaJKEsPzv+LC0tpD8tJXMwAmwo="
								"another person": "C1IZ7tP4rbrBsT7EUCkA0Ihky9d/Ucca5q0yC+AOAx4="
								"fixed yaml":     "y+YZ7AVqM2VOB0Jpl/ftK2EQf7pZcDdzloG3iaMMs5c="
							}
							multi_step: {
								hash:       "VLA6LREAPCIRES8IR91PBD52779O7OBV9T7CBV787GSHR4OS8L90===="
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
