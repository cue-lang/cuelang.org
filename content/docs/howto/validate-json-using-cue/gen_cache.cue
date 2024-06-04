package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "4y0I8vLdHuWK4brVF2yhdmFhpEQGAHlhatPoBBtvfTY="
								"x.cue":        "bfZTOzlganToHd47gVaYRKLQHyLEAzmeI/0tlYa0XiU="
								"x.json v2":    "fS57Y48YgTryojVFewLgqZMHiBc82sb1miRHtRlTJgs="
								"fixed x.json": "m4qCT2GKyeYyimSySaevsojlX+tmKiuCYMiAZXuCSHc="
							}
							multi_step: {
								hash:       "6VCN5LUT4SHQG12ACSFPNFL6HKVE34LR9N5D6P78QN7BIFKEIHT0===="
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
