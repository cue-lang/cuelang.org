package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "1geXINm+ZsvTxubDiw3n5Du8X/FFWZqUT9mW/RlBpe4="
								"schema.cue":         "RqWCl7FC2hJ+BTi/cy+2UHx4BeW6NC6VP79FdISVkeI="
								"split_pea.yml":      "Ya447sPUMqSoD2kND3BvxUpJKBliKSAnoK9HWY/A2rw="
								"pomodoro.yml":       "BGTX2041v3OsR09PSgHxUzpZDj1I0g+mhFat1yjye3g="
								"pomodoro.yml fixed": "wDvWXFt0bYDkCvOXwNsQyL9KMSEufURYRwUTKHEfdRk="
							}
							multi_step: {
								hash:       "PEH9V5O16GMGGNSILQ1B6G6L43C3573N6TCJ2S9MM9998B8M5I0G===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.4.0.20240517091053-05453ff5230f
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
