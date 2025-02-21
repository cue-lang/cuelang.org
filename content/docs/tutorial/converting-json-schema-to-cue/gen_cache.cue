package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "01CXJL0rynzlMWVxuNxiwDnH5n8Gh5J+ns99nbdPTIE="
								"schema.cue":         "tFLyzjXnezvuHNriqUu9RYT40gB8ztiyjOC3+jo+eQ0="
								"split_pea.yml":      "qpRD971X4wlgGl7ZON3C4ctx3V28NY0ZEPUXK88w+6o="
								"pomodoro.yml":       "XmdnhtAuBLJdBYBoxbhhCO/qN/v2ppPPqjQelgDMy+c="
								"pomodoro.yml fixed": "57daOTyhFdqj4PUV7p7no0proikL7aXIVWVKyCaInQo="
							}
							multi_step: {
								hash:       "MBBTMTMSABOBVUNDAOA8INB54UASB6K6EEFGAFH2BJE4LNSKIT2G===="
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
