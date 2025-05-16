package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "jWmL+cK/63GyKgOmDBBcIrCPHlQVRxpF+fLi4wcHEq0="
								"schema.cue":         "7oKweOkt0AkQE+ouPfBNK3jGivHvYiUQKbrTrqSe3g8="
								"split_pea.yml":      "sorFlUMvsNpqJwul+P5F8n7KQ4etEGau23RPEpeQwyI="
								"pomodoro.yml":       "gAPHYijsESnn1MhZlrvbCOE1Mb7B1AQhCtUCyXtMdB8="
								"pomodoro.yml fixed": "KeUVo1AOAk2s9929weEU0NchQlegxKGzXNzgy2AX9Ec="
							}
							multi_step: {
								hash:       "GIR25Q2KCE03JOH7UIA8K36I6JJIM9LQSC9RJLT5083VRIOOKH6G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.1
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
