package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "BuiBzprKxjiEAeU9SIfWYfKuSoLuUT188gLnhvlFGRg="
								"schema.cue":         "meShjCyoXqMXDRpU6bvkQlQmh5VLFzrL43ALwmzDDEI="
								"split_pea.yml":      "Vwtv94Lf+moj3+pDvdyGF9he0FgCUq2wk/6jP5lUnvA="
								"pomodoro.yml":       "ZEteV4n6D4i5DrtTpbeWU3/wET/69njutsOLYf2g8nM="
								"pomodoro.yml fixed": "dS4D15ei7yY/efvdk8MgALxXzydd2UnMmJlhRTJlqa8="
							}
							multi_step: {
								hash:       "1R74RMT9K13MDOVVTC1L11EO627G3FJ5HMDG0E4Q051A226MIHKG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.18.0-alpha.3.0.20261008224848-a4f52c2332e4
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
