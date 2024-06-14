package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "oaxOus8Z2ncDWe1cMMvM+gf4yHEL8z5LTUTwtqUp7+I="
								"x.cue":        "VHJdQ88wbo+SioNn2c4kDXnDOdWw+jVNHz3TOc20T10="
								"x.json v2":    "hOIdqEYx5RLrF0KCFirKtr9wn+qV0kIHQDNNQsB8KaY="
								"fixed x.json": "HNO0F717m80mvFauangv5VC5r2yLk752b6JvIRUu/X8="
							}
							multi_step: {
								hash:       "K1V83GCNS882B291Q5FA15L0L9OC4788047A3FUM7T8UQFJCCEF0===="
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
