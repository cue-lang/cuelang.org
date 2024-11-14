package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "lX4Letpe0yR2ES8fTFcmsAv7netZaZOMo83IsEgNkRs="
								"schema.cue":         "hbfxor57RXCFswMga0stRpvBTDaxAyhMNJfonIhoKrM="
								"split_pea.yml":      "I/B6niRGlD1UOFwVpSbA+7hs6diZxlDgteKcz8T+vDU="
								"pomodoro.yml":       "pkEH4JHKHn0F3H8c1R2b3PUWuhL+9RSLcP1xetnSgEY="
								"pomodoro.yml fixed": "noWsA0ECVrdvxoa/XDQXhqnkGGkN7TdrNo7hzAa4v4c="
							}
							multi_step: {
								hash:       "5V7AVLRQHBQGVSC4KFGAC2214NCJGK3TJ1222KF872BFF7DALV6G===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.1
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
											    ./schema.cue:10:17
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
