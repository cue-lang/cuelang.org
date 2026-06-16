package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "K35grS0BFMwJTWQ2PBxxK2x3HbpujazpZHnL0mgyx/0="
								"initial x.cue":  "q1t2w5cH7CdzZQpvHL6MwEPpwHlutJJrA4ViZsZoK3U="
								"another person": "27O8DveHtk/9tlmSB+ETIUrLco1x2KyBGZgBDB6FALc="
								"fixed yaml":     "GD2XHG/GecycxLOYn6Y1TAEWbaAtod9EZOnSMoOlWPY="
							}
							multi_step: {
								hash:       "U0QRDUJALA6UDED4O6SVV0PNV3DIK0KVCO29984M2R9LG5RMADDG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
