package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "U90R14KClvJ5XY2sM12YUlnKWj57Ad+7IzLtUbUIfLU="
								"initial x.cue":  "UrgXVogJCHIOq+5vpfpqZNh7dmeiGbhWewazCns7qxo="
								"another person": "q/YjiB+ytCu/PmfnF7rrRRS0Yr4Cm+4ShzPVJxlKRhg="
								"fixed yaml":     "f7P/shnZoA6iu/1jQicBRDYiFH9yTVzl00bKYyR5lNg="
							}
							multi_step: {
								hash:       "TPQ6G8V2F2944CJSV20N7UVV00HMRP353SSATLFVLQFHUFQTNM00===="
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
