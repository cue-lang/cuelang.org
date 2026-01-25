package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "soNspUIHsA6CisiRY7VAm7epU9VUGxAOOXqCHZ1GqZM="
								"schema.cue":         "Z+PzB2nOF/+nVuEe/EKGLiAN9Z7Nbpp1gT8q1zCPVoM="
								"split_pea.yml":      "aCTItuzYprLg3DEsj8CkhutIk1Iq50Elbic4GaW12I4="
								"pomodoro.yml":       "aSTne3sZZUHSfhbrL9YzaqtCVRs/bNg+RgEdCcMwNGE="
								"pomodoro.yml fixed": "mACJKWRHh157ag431R1OaILtQD/rN5U5bWytzKdCUxE="
							}
							multi_step: {
								hash:       "45TQHKCQBTSAVA66E53A6KDCK0F2R99SD5AU9OPPGK7I8A1DAL9G===="
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
