package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "7DZKCk73vE0AdytGchj63DxFh8OmiOo8i+BdxxZ9Hb4="
								"schema.cue":         "QHTj95EamOyXNDgk0tSfBNZrolm0qzNA0MJZ13T8kDc="
								"split_pea.yml":      "bDAY/tesaZDGZ+EtSUuFGTPz01y4570vOsfyMoDM+74="
								"pomodoro.yml":       "KQLQVh9Ckf+bM3i8cDLrwYg090vaOjgzDFk/UUS2AOM="
								"pomodoro.yml fixed": "k/0W89evg/sOqJW2IqLyA5K6C9ZBQPYMeSX+PpN2+iU="
							}
							multi_step: {
								hash:       "MLHDIGA8JMFPR59ON394F3HTGQ3OJE5PC20AM50DS776RM35T9U0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-rc.1.0.20240606084806-889da91cd963
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
