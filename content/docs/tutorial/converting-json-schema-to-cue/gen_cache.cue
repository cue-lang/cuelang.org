package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "9P6xjI4fV3vDi9wxjh5nR3BWar38TLpvdiCG/b3Q1Bo="
								"schema.cue":         "GrmxinB3FJ9HNRzDqJ8N6G5nRQzPSgAgrAxUea60YHY="
								"split_pea.yml":      "XJZUdyxL5BCSwtBCuFFkhV4ajCB2Ouw3dsT0h2rDaks="
								"pomodoro.yml":       "kuSIXMbQ4Aii3Yfi9viZxfVWLsSjmfBln1wL0WNRePk="
								"pomodoro.yml fixed": "/MsgpQb2LigPeR1vwoFZrvrIJR3/lq9iMuJKmAOntpo="
							}
							multi_step: {
								hash:       "B6RRNT37O7ADUHTQKBTOHHK179KLU0BPFDUJD36PS0L5QS6J18LG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.3
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
