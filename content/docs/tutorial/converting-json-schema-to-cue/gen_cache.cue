package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "qdqs6+Rme12xN/x1H22fNBCC/rkjVbUJxBA+55Xn9Uk="
								"schema.cue":         "rws3x1AHgW4rCurTU3206Ug/XTmmad76d1ENLM/2dUE="
								"split_pea.yml":      "3KSjiVrKiWBSbLFsD2+cP55bzrlPSkoVgI+bqFL7HzU="
								"pomodoro.yml":       "Y6zYULQhOIvMUOW9xenSCESC/LSVU6EH5TrTnrGm858="
								"pomodoro.yml fixed": "TICAryiXGO+Ph4yyldlc1woOX6Q+jx9nC+rwOZRqT/A="
							}
							multi_step: {
								hash:       "MCT4DVMPM5SCGS53ND9K7MRL2CK1OHTCPN46HOJ9JJ33ASFUJKMG===="
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
