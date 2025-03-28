package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "coyD34ghAan1d/72dhNp+NYe6QXF9svHlm8bppMp0mo="
								"x.cue":        "BMLW80Sl4lexI/J9tKtiT/Jujh6HurSvUktCtvZwpc4="
								"x.json v2":    "JiCaxauRxorr0igvv3Nk4F/xPZQMXzsjwD9RCqGh+5s="
								"fixed x.json": "rRg3/1dVVyGh886OMe0v9+Wo88otVDZ/oesQuh0CBlI="
							}
							multi_step: {
								hash:       "SBBRK4V7PCH5KEBURLKI8KHEVE6ADU9BF9C98FVDBGF7CP23LMGG===="
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
