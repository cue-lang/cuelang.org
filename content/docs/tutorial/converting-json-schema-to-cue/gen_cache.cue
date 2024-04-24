package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "SeX7gIe97C2WOnQJH6yfuEQAqwjRe7Q0LQCmrMfP+Cw="
								"schema.cue":         "11Oa+46m8Ncu8V8aqA+XKntykwh7wKzp5Omgm5jiOKs="
								"split_pea.yml":      "0tQ4sHoIpL2TcOPZFAQGEBxU4LHUpcv5q1ZKg42qUcE="
								"pomodoro.yml":       "DXRgeu97jGp/4jEU8VNvQ4UjBlSlya+g+A5Ud/rMlOI="
								"pomodoro.yml fixed": "B/7gGIqWaqWBcGQjalyAmcLqp2psXMl/pxhRUGSnKoI="
							}
							multi_step: {
								hash:       "03LUJ7TATT4T4EJFUF76L3VLKFBIUHIIECBJAA84SK5894U04UBG===="
								scriptHash: "371283LR856JI9DINL6CM8PG1SOSHKKGI610TKJJNU4V9CL0M36G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.3
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
