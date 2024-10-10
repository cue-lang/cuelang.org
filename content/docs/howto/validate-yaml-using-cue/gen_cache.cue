package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "oVEVb0R5Gr+BvQ0LZ2hQJuYHl9AHfbwEKKWenzEFvhw="
								"initial x.cue":  "8lU0NmyMx4LyOtr9wd8jYs5zuPSf482kQ8n0jLJqR8k="
								"another person": "I+Az1PiJ5cpQ1pJ0izyRRkxqHjQE8QKpKEUwmP7UiQw="
								"fixed yaml":     "c2Iy9/szPQCgGFevzRu+5ooEcfDpvnETsfHZI8NmVBQ="
							}
							multi_step: {
								hash:       "UH4SPBL6N1N4024TL8FK4CHRJ2R62UMSQQI3I6CJLITQKM6VV1AG===="
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
