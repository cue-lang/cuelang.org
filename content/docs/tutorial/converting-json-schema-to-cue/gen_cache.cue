package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "PaIfcyH2r1KQr5gZxMcC0+p6k+um1vMGbYRSlENqp5k="
								"schema.cue":         "BgLBPxjUq3HzwizB3yJ0HNQAFiKvC5WCdGiLPsJKSN0="
								"split_pea.yml":      "9+nKNeEJfCzA4NjIs29Mo8/oEpwc9QA6b7i6+974Jog="
								"pomodoro.yml":       "qrSyxzRl4Ijnmv0k2d5QHD3oIMEE1Ybg5BztbziaGPY="
								"pomodoro.yml fixed": "dBTJAmvkh+thsmsh4+gwoUuZxU9U5K5RJ1T/JBgzcIQ="
							}
							multi_step: {
								hash:       "1DJRVI1U6OAOKNQ2FHDSN0GKV6S0DN73VGMDBBBC3OVCNKBM7J20===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
