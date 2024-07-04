package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "4HK9E19g6NXmPMnbWjXcsckXsxtuMFn3bikwSoIqWos="
								"schema.cue":         "/U4Nzl0wuOjvb/xYeZA7lZgqJDrvC3R4X4ExdS+C9dc="
								"split_pea.yml":      "3az2COVJD2JzoyJXHPz6dr1n5014TG0ZD138GinG7tM="
								"pomodoro.yml":       "MOv+1WTY74VOXlo77EGGbKj7ISXLjIeWdRTsK239gVg="
								"pomodoro.yml fixed": "Tv/Ss+PG8bk5XzWDoUrS3ulq5xulFdJPBhtUedfLDJ8="
							}
							multi_step: {
								hash:       "4QO1JOJ22VODHKKUB42IA0JGACBDVHUM8J2HKFA6MG8DM39I0520===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.2
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
