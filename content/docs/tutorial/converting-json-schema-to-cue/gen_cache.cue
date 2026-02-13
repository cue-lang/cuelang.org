package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "4PacmnjChk5jcxXb5P3XIrx4Ml2/eSYTHqhW73WV2pw="
								"schema.cue":         "mH5p3Bn+Zc4dqUKpquVtmtZrudR1ROq4R4jrK+1CxjI="
								"split_pea.yml":      "+QtA8mnUQe4FFV0SuIUF9v/jT4I8RnNkBB/OC7qAqV4="
								"pomodoro.yml":       "2NTWSHsUiq1g+UX61gFbc1TAQ2d2TvR+w8hHb7WRMBw="
								"pomodoro.yml fixed": "sJKtSsYzaMsjyenFViE7HA42ly4Gev9dRRXy7ajThZY="
							}
							multi_step: {
								hash:       "ER8DNH30TUI4BM1G7NQ08R70CIKM4KPUBCH7ICJTBCP9705T76HG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.0-alpha.1.0.20260213130521-9e2dec3b9a23
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
