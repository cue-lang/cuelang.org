package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "RCK6uj3oha/uthUoUz6Of/8aAqacBNijmO4BGWV/wPI="
								"x.cue":        "HcyHKrxpKInOH9NPnPPRiOahdT0OmEDoTobaCaEXEww="
								"x.json v2":    "jRX8PMv9//mV24l+YDWt4YS48O/1i3LcEIsDx5qCWvo="
								"fixed x.json": "ueQZboTMeTVQIx5hQh5cpBQAl9dHApeJCsvDJawEe0M="
							}
							multi_step: {
								hash:       "65BG5BS8QGVIPD8OUS86SPTA7UEB665GTFUEGBGMBAJSGK6Q9U5G===="
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
