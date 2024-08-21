package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "6r74hzrd51LWXmxbFN5Hsa9h4cU8VV7v34CzqawjIpE="
								"x.cue":        "f5TfKtJi3vIHI3rvhUw/NWWh2smtMTaUzfqOzQfdfp8="
								"x.json v2":    "bq/p298UgO+9p0CGBwf0+YlLa8feYJ1I04Od23JXLuc="
								"fixed x.json": "353rRTZ0/nvUHCVd6ckjooc24Zjxx6w2Qrc1ycrI1gA="
							}
							multi_step: {
								hash:       "T6O6Q9V13PNCJ5TUBCIU4S8O4BHNCV2L1VJIV1U4T48OE5JQ36I0===="
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
