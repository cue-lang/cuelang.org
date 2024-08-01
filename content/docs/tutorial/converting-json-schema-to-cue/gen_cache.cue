package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "FG1yRH3Bm6zKDcnPHJJjC7cm093zsQsKTFucFxVLJlU="
								"schema.cue":         "q9RvTnaF8531u1UGzdyFmtVRGiHFIoedyc7enocbL/g="
								"split_pea.yml":      "p8TZS9bnfOyLg4Csv7+MLKz8o3IR5IvRQFhjmpF0SFY="
								"pomodoro.yml":       "cKsCbVuFbeS0rO8CoxJ+belShRc9BoMfWOW+MpHRtDE="
								"pomodoro.yml fixed": "nrPuaBlarrxjeIBCy3/V55MOPJdeui9jBzAwU3+U0+M="
							}
							multi_step: {
								hash:       "7UP53SMA3UABR1VVF36K5OKTNNP4BFJUEKVRKQ8EDQLCID7OL4AG===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.2
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
