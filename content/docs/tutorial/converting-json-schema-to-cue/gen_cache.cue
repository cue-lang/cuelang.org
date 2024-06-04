package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "uINmZ97+G+kYqSbOr90OJ8zVkCg6Ila5f/oeFZy+dbk="
								"schema.cue":         "HkWM6b1Bqm8HiU6z0CkOkP7EjpdSDMpzMoezsHs2Pjs="
								"split_pea.yml":      "4/h1TccYyGJ/1+Yb0rslKp3aUt/THjQrXzWHB5z/kZs="
								"pomodoro.yml":       "z2gkO7bjKQfvzJaOWspBtCigjWAVEnMqqv8FuTLi7TA="
								"pomodoro.yml fixed": "81C8Me/8X0RD+yBJBX3U/kU6tXR8J7tUeUHmEuLZ7T0="
							}
							multi_step: {
								hash:       "5VUTGFPOUUA1U2KQG2U3RM1NUQUA15NFS44LHUP2N51AE1GAI93G===="
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
