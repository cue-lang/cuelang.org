package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "tsun8JjeOuPJ54Z0j9/OOrAsknmLzU+eKcbzkwwc65Q="
								"initial x.cue":  "BJfQQzGdXbzPTYWBLZoJVCDH8DpRCY9tdJ4mAFCg554="
								"another person": "G78dnaBOfXjqOZDeEN+MzlvszhZvsFWcCrok1zE+nQQ="
								"fixed yaml":     "F4w2hegdvK5D9weJyf8Ge1SngQoHDxk8uHGORF2mtyA="
							}
							multi_step: {
								hash:       "3VD76IHJM7HEQIV2MRLTIJH34TN7PSCKQHUH8IP84C96QOR86F6G===="
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
