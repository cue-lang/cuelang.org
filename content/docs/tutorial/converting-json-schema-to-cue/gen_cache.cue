package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "BNe0UiuQYK+tzMwIlKPeTgqK+hykRohAdk7dP57PWR8="
								"schema.cue":         "MiCcyYbixQw3MXJpPUwiylKvbbb1APhq0vLkmgF7U7w="
								"split_pea.yml":      "xD5PQVedU3GnXKB0YxEh5azsA65jVzq7FEbLnUWetjg="
								"pomodoro.yml":       "VeHca0Voed4QVCRfxwglRj2987zarcYtjVEUSQfdUZc="
								"pomodoro.yml fixed": "yav+bOvCuzIlPS/7t8L9oNasKmtbwJ8WAMl09Rhmjdc="
							}
							multi_step: {
								hash:       "AJM76AMG89GAJL6OS9IR5PD3JKQ1N93CE9HNUTTQCHCT9IUA1EA0===="
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
