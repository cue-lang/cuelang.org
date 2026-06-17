package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "DxBRE596JE0u4ygTNt6Q1ahXJNPUca3pvBSfrwDvFrg="
								"schema.cue":         "qDOOS9GOESlzMtksr2p1vIC7dNrbdSmrhvL69PlfHaI="
								"split_pea.yml":      "rh0Lfo+nKtuJJ/AHoQCfE3an6AVodd5lQyxb0RWmpEs="
								"pomodoro.yml":       "Fa/Wxzi3ve8HClO00zQM/VGH6pOGBut9Y2O4nglmE+U="
								"pomodoro.yml fixed": "Qy8X1QNTCB5ziEyOQYT+vEcNlC1vLkLqqQ8LC/JTqzU="
							}
							multi_step: {
								hash:       "TMF5H7RKVQJHT6A139RNC6KRLBTDQPIAH9IR7BJRAH1F23JBT030===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.1
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
