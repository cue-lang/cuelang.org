package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "DJc4Y1ub746x7+zjgq33TZNYgk7UKk1nSUwZnVW0iDY="
								"x.cue":        "mUXoHjyqheh7G+uUg0Mp3yT4JFX1TkKuUXrc+GGpOAM="
								"x.json v2":    "ZagPWezVNyQ/0T3qQ9/fI/IKae8tlQWwf6tjunvYEQk="
								"fixed x.json": "ZVUqWG14hFgPnWw8WAGYg4nxzbKeb1YcAC9vOf/GFrg="
							}
							multi_step: {
								hash:       "HTP5EA5EUA5A2D3VTSG71AQ6NGLD82J7BN7HTCJPOIH5DBM8R4B0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
