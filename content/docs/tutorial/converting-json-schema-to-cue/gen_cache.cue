package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "XnDHGQxBERqsfiPUSWDrSd8w0gD/gF/P5WqG2G+dGgo="
								"schema.cue":         "8pY5qZWp7VDR1bwKew3qZDKs0VogW13tUMsJ/0DR6s4="
								"split_pea.yml":      "E17tzizPVfOiFZQtf4SEOixqkKC7L09wGSn5ZETKy5Y="
								"pomodoro.yml":       "YrvSxDvGIH1YQNQT/KPgf8LevlsHkX4zs3ZYpvyBOrc="
								"pomodoro.yml fixed": "59Uc0GtTKcRZ7VwTWY/bEAOc9sAQJ1W4/kEWJobW9r0="
							}
							multi_step: {
								hash:       "D4D35C0HTDL8BRR2J1DKBKQ1VP1DEQO1B0OA7EVBIUHGRQ78F19G===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
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
											    ./schema.cue:10:17
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
