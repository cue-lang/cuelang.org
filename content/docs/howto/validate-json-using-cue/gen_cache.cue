package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ZrfjSlRAZB3hRWWBLS1ajt2x1/6IE/6YGslOVsQYTvs="
								"x.cue":        "pFSMqw20o2R2polNz25tVIHHoPQpBxX/MSpzOVJ7q3c="
								"x.json v2":    "kpvIeNXYM76A9tYOJP4DOquo9Wn4OKdMDaMamKNFqJw="
								"fixed x.json": "aHFcrxodqbBTHgIR3hrXA14DcGZ0CT/7Gx/tTaEereo="
							}
							multi_step: {
								hash:       "7OGU4NA86IS1I0QNSPU6DAH5L9TI6EA0N46273JOUGBMQADCQVMG===="
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
