package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "TPX7MLBtfGKtDZ1U0A+I3hOKcnH+475yaB34vLO5vJY="
								"schema.cue":         "7/vUH8mIrmaAmt62etSaObCq3VKcv8t+/hkoKbHfNBI="
								"split_pea.yml":      "J77kjjFzJbOeIjEBplRL7/gDNC4ZCDv4k8Nk8y3HIEw="
								"pomodoro.yml":       "ZieKXthW43njppl8z2EvUc0Jw2BhgTa61rQbTPsYZSo="
								"pomodoro.yml fixed": "AVLIZzHP3xizmXJupFRsKbEhoiX4b0HE9dDfbhNodQg="
							}
							multi_step: {
								hash:       "K5UKBILOFG521LU0MFR00GU9ALIL0LG3BETPGTRF8OTMRHJOTD2G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
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
