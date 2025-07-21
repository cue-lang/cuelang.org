package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "DPeNn+aVDEbduVWiRvlX4lGOGA63xXJsfN83vhviyWI="
								"initial x.cue":  "QRMkQ8/tzHIH6d26AX5jVltcSEGO9AJPZOo6U+vus98="
								"another person": "TDI6eXqjDcmvz3yXlBohOqOVE6QzGjudoQ0Hn/KILuQ="
								"fixed yaml":     "8D8VgMklBixK132zVkh3QD94z4o870l7r00pUjpRSEk="
							}
							multi_step: {
								hash:       "UAQ7UH7433VGEP0ENG6E82U6J33IS0G092IRJLUJHFTKOEOSU4J0===="
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
