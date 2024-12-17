package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "iEVS2DSLh/ky16GL3ikDxbDTvIoZMv454zcFfWjBk/Y="
								"schema.cue":         "3MbJbkYu0kPoCoId58kRl+Y8xmflaaWwoKmU6lQHptg="
								"split_pea.yml":      "UxEgCk8nWpEluNf8r6tVMWJl9Sh1rS/8SX3/Xpl/1+U="
								"pomodoro.yml":       "Pt5o2CsF9LCtktGp5Odo3B/vanYAwn7hjVQG1S9sDoU="
								"pomodoro.yml fixed": "iKrYngHQKdG8RN6GyUeyk74mQ53lSnQnnfqlNHNACCE="
							}
							multi_step: {
								hash:       "BO5358MUA58V67556OOVNF5IBAS6QSA9M18FNV6U1BE5HODBO4E0===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0
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
											    ./schema.cue:12:17
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
