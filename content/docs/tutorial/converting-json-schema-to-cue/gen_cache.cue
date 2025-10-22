package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "s1FzyO47aMvSXxCnjvqQ4tW1BKwoOYInRfpsRM+82Xg="
								"schema.cue":         "wJJ6Bis850G4s2trHzk8Q1zbWj9M4riiAYhWL4NmmTE="
								"split_pea.yml":      "wbz4tbcnf+XTBQISWYtwm0Hi/xIhnZkZhdCgpONoK1E="
								"pomodoro.yml":       "RriyUB9Y41PfCoBicIumJCpC75rPsMPh21OvsMV6ZDg="
								"pomodoro.yml fixed": "f5MjTvb63sEFFwA9wmWrtkJqAfi7fnFadKVh5s5qZS4="
							}
							multi_step: {
								hash:       "K2MQ32RMLC188MD1DIU2LOEMDAPQE7PKF2Q8TFR72SH1HHPQQFQG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.2
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
