package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "K24YoHIa8RUQjss69uMOkr6aPEYwz3rFFAl0f9N2mhc="
								"schema.cue":         "44dnL9yH82Oq61sZ1TFOAQI4+O9QHcqnsabn9jjUlUM="
								"split_pea.yml":      "D/FoD/+0kaHTDTz5wM4yu5Xo8zsoL6pi6TEK+P3gjSU="
								"pomodoro.yml":       "JU6ncS/cqDJXCAgATVyp2R7H1YiUlJu3+H5eRQvYnDw="
								"pomodoro.yml fixed": "1n+mmmtZ5y4qWipKHkjksHTFMTrkEVJ2eKNkclQbboQ="
							}
							multi_step: {
								hash:       "LGAKHSM5999USS8L8OG6CUOTOH2HKAVTCSO4AB6E7CHV4NKVPTU0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.1
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
											    ./schema.cue:10:16
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
