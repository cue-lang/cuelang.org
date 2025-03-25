package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "eQHPt+9yW4lxdp0rXCLXJ8K66gydaPoZSOC6V3uc1uw="
								"schema.cue":         "/n8SNSqr+17BS0uGU+dNoT26c5K5U2lB3QFXYyvzOfI="
								"split_pea.yml":      "SjFTtWTB4e11WUW9n4xxPvDhixF/dqkGDE87B7JRlAs="
								"pomodoro.yml":       "sAahGC7lSpBwaQFrFcH8Gdo3WjOnDQPn0uMJO1ysd9w="
								"pomodoro.yml fixed": "QUFb2WZLFORoRo2GyDyiL1QSjxDz7TWjfKbB77AZB68="
							}
							multi_step: {
								hash:       "UKGBT9MQ7QR2CSH0T0727I0P6DL62L9CPMC771F8SA53EGAJIE60===="
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
