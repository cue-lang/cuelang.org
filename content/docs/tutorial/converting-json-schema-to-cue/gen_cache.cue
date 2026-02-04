package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "e7QRfii+/iYDJ3wzQsn80klWP6HXj6mgTqc/nxBBl7g="
								"schema.cue":         "zyP064WE8QUyyakEeKSbmBOCr/vMxJ/QV9k08TvqWds="
								"split_pea.yml":      "mk4TXVFxVug+TYOsAeiuzN/88pGyGnRWwlK3F07/0vY="
								"pomodoro.yml":       "TKPmrxuZCRun8sOxAPP9U1O45I7B/bzJzK8smhMCgTY="
								"pomodoro.yml fixed": "Wgu+EauLopmxdI5DKquHX58UDshHtcF35KBZ8aUIQfw="
							}
							multi_step: {
								hash:       "3T3J0MKORLUQRV7RU3J696PENL8M4LGK93NE8OAN3GPCQ2HDEHAG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.0-alpha.1.0.20260204102828-049d6e12211e
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
