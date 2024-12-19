package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "2YJs7Tq3s40bcc6aDb05QcvFtjWQacYxosHwb8UiN3A="
								"schema.cue":         "bjTcAyaJRPC5gfRg8UrFssGZktGCCI3xiXSP1qcenaI="
								"split_pea.yml":      "E+mzDJraZHNQyu4ha5/Qwq3Vg2yvEXIWU23a/FGm7NQ="
								"pomodoro.yml":       "DQIUCVJDmPyQOHrxXW/fG1Z2N5WAXAeEZoNSPyIuk+g="
								"pomodoro.yml fixed": "zy39Bsmk5z8XJzVFVmOzaGRGPY0F5Sch/KqpO3qt7fg="
							}
							multi_step: {
								hash:       "9GOPH196JRRHA9A90ED7HK7PNFK0CISMNPIA2AOKNK46ROUDTVEG===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.1
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
											    ./schema.cue:12:17
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
