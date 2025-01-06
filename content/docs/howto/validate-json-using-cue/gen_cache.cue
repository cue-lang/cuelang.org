package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "WB0rojsNodOvtiZWvLrZ9A9pkpU75wjMXKtik16FpzE="
								"x.cue":        "gylc+pQzNRwdiyeaMhOH+CL6LTk4iLbL0XIzKSyH8Ww="
								"x.json v2":    "FTsRGuS773eomUkWE6CuIDdZ5k7xTOrvo9SpX/OqkB4="
								"fixed x.json": "ETjtT8DXzazpQtjI3khxD50fxKAoDqJYQyIPeDPjFZU="
							}
							multi_step: {
								hash:       "MK6BSQG7GLEOO6QL10RELCC92UMAFIA0HS1JS5BBTLAQ11U73P30===="
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
