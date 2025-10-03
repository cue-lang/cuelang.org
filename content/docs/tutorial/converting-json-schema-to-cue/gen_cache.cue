package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "gewEY6wEPlrRwMonfrzvJ8NRLm0kZGM4PKYDPQrQA8Y="
								"schema.cue":         "cS2rNjB3k4z/q2mk9j2bN6jo/zY5WkhAmBjDTziT/Q4="
								"split_pea.yml":      "T/XvD5wJroJC6eHf1FhxVCqGL63+O3Fulc1zZhXN8ig="
								"pomodoro.yml":       "1AjBmKprG9Q3i9ICz+TZeIDM9oRGlbIYlOrNRo4xHz4="
								"pomodoro.yml fixed": "jTB0nvf5qlVbC/34Yz0ZZw3dtk8NseFL48+qST3Hne4="
							}
							multi_step: {
								hash:       "2L5CE9IMFO6V1STNPH9OJES43AGOU93R79CJ015KAKARBR0R8300===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0-alpha.1.0.20251003162346-5c15642ab78c
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
