package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "yUD4trWXQA92qOgF9oD9MnoRg8m+P1LvqJ/MtKdN4jU="
								"initial x.cue":  "omRfW5WlQH6YITGo2cxJ4FsS6ZTDKwn7ipJghD+fKGE="
								"another person": "Bsv/6gApmCqsTUnCbr5sqLQyWY2N8uu6m08gcbO1+gQ="
								"fixed yaml":     "vaascIVnDMoeKI0rejW7wEG/rbZljCy0LzGR5D8ado4="
							}
							multi_step: {
								hash:       "J3QT7TJNU0HH5ENC2JMTKATNLJ4DFMFRCFB1UU9S58BG36I59460===="
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
