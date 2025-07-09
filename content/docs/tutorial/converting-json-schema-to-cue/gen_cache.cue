package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "zOLXXwXweuY/JeaQqklp1lkNKtGcQoM4pWNvysAw3JA="
								"schema.cue":         "zWlpBCSURaw5HO6JJULDr+8qPFc8+S+lvKI916O/XIc="
								"split_pea.yml":      "BKopS/Pq4/pJOsBMfMCjFB64TufmSMsQVPZCnyhw+mQ="
								"pomodoro.yml":       "GukX2kB8bkelDgwucx2kxaP1sRn5qWz6SPPMJzqaqNM="
								"pomodoro.yml fixed": "Fa8/ttGHy28kQLTEtgiKhSzw9KIidCLuiLtBtVQrYBI="
							}
							multi_step: {
								hash:       "32IL6UCUOFRI2JMUM2BJE7OAT53RTDMS3Q35871SVLN6FDTH31JG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.2
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
