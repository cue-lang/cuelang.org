package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "jkjKRYPMWGIpANLQjp2pKY2PeNI8W57qb0r4/3fR628="
								"x.cue":        "5q3VIaITG5UM43VYxCb2wYjrwPKCpHii20zids6cEFc="
								"x.json v2":    "YxXP1FyafFNT9ePsHe5tsDBVqDk/IcSX9/aL4DzVpTE="
								"fixed x.json": "UXJLVC/VQcfO4j8LjDr6jcu274MENj11C4mUQR0WmGg="
							}
							multi_step: {
								hash:       "J8HQR7TU9M9BV319PJAD8FL89HTSNS6JA0C0BEM1BSG0Q9JLBMC0===="
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
