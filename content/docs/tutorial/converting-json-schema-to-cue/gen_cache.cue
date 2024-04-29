package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "MK/T/c4FbP9xx75sdeXpiKL9VtOakPttAH3Dl7J6LXY="
								"schema.cue":         "/f8TxPczvo8jVjnF1EDxebA1RMrUJZ829oV/YDxtFrA="
								"split_pea.yml":      "cISaTcNoISqW3uE2RW9uij9GZZri3+R14Mc9Q9kjknw="
								"pomodoro.yml":       "LSE1hunKkAT0qOmX+2AtY1gRDBW7dtrWDSyWGVsWhCo="
								"pomodoro.yml fixed": "fQrjqdc3wRVC3bfOZqQgnxryUfqGKxsJJFBV+uuwkP8="
							}
							multi_step: {
								hash:       "HDTV078RK72VCQ90NC29PV0LEQAIOQKAL0V9B5J84ORR7H26VPP0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.3
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
											    ./schema.cue:10:16
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
