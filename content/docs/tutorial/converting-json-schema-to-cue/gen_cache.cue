package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "RU6daf2UObWbkhn1R9HxT5+RJpfs5eITiC4H/pEcMjE="
								"schema.cue":         "/CnoVZ94JsP+iokQZsFUir1GV6Q6JtOQ8uccm4uToD0="
								"split_pea.yml":      "CNlySbwlem+0r+6o/tJU2ksk8dd/BjIK8BzampPyXzI="
								"pomodoro.yml":       "nFPou7s40G88HGo1zsVqShpCz67UkceOfPoigSrOg18="
								"pomodoro.yml fixed": "fEMiQtgUjfzWZ4yhaScIBwtFyDjd3fzdFlHnwe/FPkM="
							}
							multi_step: {
								hash:       "M0K0U2CVA0SBEMDEHOSHSNKS3UKPENL14B41U9MAPUOMM37C0180===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.3
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
