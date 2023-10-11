package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "Zd+mJQiSXS2Hgqv64vwXD9aNAe3GePEO3QLIOa0M/4k="
								"initial x.cue":  "fMd6ePb72U7/3aviYNGHHgxcaIdc4rjaYSZIn4QY170="
								"another person": "2ciOp/Nhp6WXyKPwf21XAY/LuE3EWEmXDJCZSmcPvwY="
								"fixed yaml":     "kZGMqoGsSB0KMuieVdzTcsVFULgzHs2qZd2LlYd0Pmw="
							}
							multi_step: {
								"BFM42GSE7L97V0IR3H53CB1DBDRH5C1J8UN0HUE274CE3AAT0VTG====": [{
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									cmd:      "cue vet x.cue x.yaml"
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
