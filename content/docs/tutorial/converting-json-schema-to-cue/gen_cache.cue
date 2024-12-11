package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "VYHUMj/95hrQxfYSEdzfZDrVdC4ZUydpgm6m4qt46/Q="
								"schema.cue":         "blEv1+KUKOQJsPFpjN0q4WJKZjPhfq8SIfxOSjqr004="
								"split_pea.yml":      "Yt+YdDcJFAytGOMMHG9Pf4WOJuuxRow6rA3ixDvdaiM="
								"pomodoro.yml":       "VU4wCr8MUEvx/2gKw91TK9FdKo/BVawH2AfnXUnsIEU="
								"pomodoro.yml fixed": "poI8fJjzItsZGKAiKuBoLQbaD0WAxNaL4mLjMwcety8="
							}
							multi_step: {
								hash:       "9K0HA20J44091DQ1JP7CUOFLII9DS62KNTT7QPDE6438HTSS3T1G===="
								scriptHash: "F13IT2J3MN36GG3N09O9518426I38RFFPOPK0L8BIOG0OSCEHI0G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-0.dev.0.20241211161443-0005c227d164
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
											    ./schema.cue:12:17
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
