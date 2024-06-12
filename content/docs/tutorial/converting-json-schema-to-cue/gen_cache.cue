package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "KM/w2tYlVJV4qANKD1PqsEhZ0ZYdhv6461BlCP4VOb0="
								"schema.cue":         "Ge90bqdbawG4WQYx8yHPX6oiVlWTiggjcYjoNbKy12Q="
								"split_pea.yml":      "kC4dgfQfZJEKqjJxhzA7+6Bfb5s45biPhmQTzj5tXRY="
								"pomodoro.yml":       "DxD0t/K8DYbb02j5J0IGXiC3rvCy4BCRDIuMe7Ae8Pc="
								"pomodoro.yml fixed": "XeUEewqFOjRWe/QmGzD5BdcrgwcEwC8C02othKW6PvM="
							}
							multi_step: {
								hash:       "JAJVNOR5LCDJJRPJEVK25P8SSDJOJ18BJ0GSC942KUEFLIEC95I0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.1-0.20240612182947-d8742c13dce6
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
