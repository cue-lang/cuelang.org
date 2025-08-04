package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "BT0bZhZSIpIoDV5EWrPj/4hEpPZepCyPmIEZbP/6Kzc="
								"schema.cue":         "Zq+zJOKjbS1UZUDX8Ey8Tbvh9TIxMql8QjoqbH4ezyA="
								"split_pea.yml":      "5dsSPd9W0KyAPGJ98BltvFPQEw9MUJV2uGbC6hsoZkQ="
								"pomodoro.yml":       "BRO57eUHnTvyVeUiygPWutTY7T5hd+/D+Beh8htcWVg="
								"pomodoro.yml fixed": "E0ezycvWQSak2rAZHlWhm1/PmvF7dWZlE+ekQn5UW0Y="
							}
							multi_step: {
								hash:       "GU88R34QV2TAK4AT3VTNTJAA5HH8EMLR432M4HV139IQQJG7KRFG===="
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
