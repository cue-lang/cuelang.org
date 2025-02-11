package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "ovxN/giJorGhQnBytPaUNJVxOLLhkcbBq+SZG9/BJ7w="
								"initial x.cue":  "1ESbjojuyo6ILCtSL/tQU+L6Zj4OKo9rRRqECSF9kFU="
								"another person": "KVsjksAa36QrS6mc6W69ZnHoB9fx0tzpziWHqIcOJi4="
								"fixed yaml":     "EE4DsyuCzxyxEsepHSGlyP430VQWbJuGQceuuUxDIbQ="
							}
							multi_step: {
								hash:       "M1KJ3U7QEBVLD2SDKOE19MOJGS358I5T78RKJM920ILO1EKRP72G===="
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
