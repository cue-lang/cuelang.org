package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "PAlUrQ9Xabf4tOxAsiJ+gtUku1WLhTXdREN+L1+1FXI="
								"schema.cue":         "2ASelrfaN7rzLykOiIJ0ScZbwlAX0MgXgdkURydBWU8="
								"split_pea.yml":      "rbCSPp/DXqRhMbUyVNrcsJZzUW9jW4FfG0m6mF7rXx8="
								"pomodoro.yml":       "1XMq1GQ1gn07nC5oCzeqITMWRWiwazNBRhyzZj0+jUo="
								"pomodoro.yml fixed": "vrH75AaNEpgdnaCgle0qeZSM+U0e5rpLNsWbcsQkfj8="
							}
							multi_step: {
								hash:       "JCL7AKUC5OCHB1LJSORBB7AI2J3PJ57IB4G6RVHGHVU9O5N0GQMG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.4
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
