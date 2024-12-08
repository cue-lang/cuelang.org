package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "cRGlMtbK5bv/oQv1P9BSYsvXts4bNBgp44Q4oc670cU="
								"schema.cue":         "3uzVdf/76zHJoMrTuuyS6EjiEyPWaQ6RHKSY1yLbRDg="
								"split_pea.yml":      "FiWStQhwjFTMRvW6dtfB3jCilcKUE+nhM60MGFAErjI="
								"pomodoro.yml":       "SqlPOd6wIp1alaVezdKrPYxk/FK3a5if9vCJlMkLoUQ="
								"pomodoro.yml fixed": "RahxDg68jI2iF/rXG/eU/HtPTNtb05/4iJ78VMbZ7PY="
							}
							multi_step: {
								hash:       "GK5N1LT3RB72QGV0ACALAFJJKTCGI7P2FKH6HVALGD24SQR2C46G===="
								scriptHash: "F13IT2J3MN36GG3N09O9518426I38RFFPOPK0L8BIOG0OSCEHI0G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-0.dev.0.20241208100708-432c1141e6e7
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
