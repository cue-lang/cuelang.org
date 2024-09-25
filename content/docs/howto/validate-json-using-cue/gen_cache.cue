package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "4iswUeKTj0NEM9kZg4PXxLIILqcv+RMfv0hKZ4Uz1po="
								"x.cue":        "wbMbXOuNGbWR4KwVquuHO5MqxXsjs83QoO4IxVhoaps="
								"x.json v2":    "tOwNZ24W8gAgW64Y5HJahbZUrzUMjI7DZxb1nfuoL64="
								"fixed x.json": "hKwnXO3CwGBnso0upS3Yf/XW35sgfn1REWd+DTu7sHU="
							}
							multi_step: {
								hash:       "LVAPU8VOLH9FC91F6H4FUH4KA10BGUFJEJ88I3BGH2V19F9O9DT0===="
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
