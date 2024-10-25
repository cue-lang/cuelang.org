package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "AwQKv5QmRN7H7ArSSzCHYAjSgdqKxTwi2YY7p7aPP80="
								"x.cue":        "JTlUyb84zAJH+JAXBT5G8kItzazb0UgNnHodL9hLDe8="
								"x.json v2":    "biwi2wvXMY6fs1cVo5DdrA2cRjijfPG4WHNrKRyt7dU="
								"fixed x.json": "SHFcBu3isn+HNh6xU3SgErGRJ+O2QXKpp0YaLaobc7k="
							}
							multi_step: {
								hash:       "MLTBV8TLLUFU83EDJ0RJ4OUI4QHQDUKRK4RAVIUDKTQ16MNHTOLG===="
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
