package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ylEM5VXoQr6LXKD/iNUHXDy4Hy81bhvb6BvPlhmMuFU="
								"schema.cue":         "n74Y7G29YSvPMq8C3PrhTwxiZ5yfRcZ91yDaX23f+ZU="
								"split_pea.yml":      "Cf59rt5cmyCqFlK/cZNzPCzj1vbiK6qW+8h6aEAttmI="
								"pomodoro.yml":       "7f/+kRxmttIsoWdf9EqnvX9FrQLTtfgWeG0NO/26BTk="
								"pomodoro.yml fixed": "CHQNr8cthzVhUUgnRyCHp7bvifUK8P9yC8PUBJ63RyY="
							}
							multi_step: {
								hash:       "CBSTCDGGNFVBNE5TITQO9IR97D5PG0A115SOU0U1Q96008Q6GNN0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.1
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
