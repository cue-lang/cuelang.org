package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "haLwETNjvSKrHQ89rFgUzUl6ZFE3Px7YIOOrh5uhe2I="
								"schema.cue":         "+J3z++J6c+XYHpuTypa74s3EpydwXonHDwXEAL+Kg9o="
								"split_pea.yml":      "XvDG6Rj+UCg9TH49OScttzKxWI6N71hYHQS+JqLjo0U="
								"pomodoro.yml":       "2Ld5EDYQFXs/TldKEB9pIwWwWGLSVRARLLwyCDGJkGg="
								"pomodoro.yml fixed": "4A7URt7qX6/Nu4ULbXhCTKYl78blXRlIu9+E+CNQtBU="
							}
							multi_step: {
								hash:       "BAMU78PPR8V3UTK525JA7RJIN0OLBRRKQDFRJBE664R6V5KADOU0===="
								scriptHash: "F13IT2J3MN36GG3N09O9518426I38RFFPOPK0L8BIOG0OSCEHI0G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0
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
