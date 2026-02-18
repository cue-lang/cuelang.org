package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "kZzPE01fffeDFW6w0I7kftE3uyQEu5kT2kU8X7Ip5pM="
								"schema.cue":         "P1dXwIlJy/EAK2Q3Qq6G/JeorG/yLL/YiiCm96I3lQI="
								"split_pea.yml":      "E0zqJzhgGVHZObg7I8mIni+pZI1coGp37rRoyfNpJsk="
								"pomodoro.yml":       "m47h8/ILodvaxwx6m6+m1zgQTWRqv3UkOml/MC9MoG4="
								"pomodoro.yml fixed": "yJSfXZohQoMl1cBOxWYYNHsEOcwZUDyV+vE4QA6qpng="
							}
							multi_step: {
								hash:       "HO29KIUP42F7QQUGMPSTU8RH3BRDJQOTHEUFT0J11JKH1NKAS24G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.4
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
