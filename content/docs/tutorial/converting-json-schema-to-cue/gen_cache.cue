package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "VyYZXwg2cTlFPSEwe1DBaSY6x2FQz3+C5n9+MArllg0="
								"schema.cue":         "ZnsPHGAL/XQWvwUDLPITpHbd24Bt1ua5qcN1zpkPdCs="
								"split_pea.yml":      "al2nrrzWccEXu3LWXjmchkmo0ySplY1kuPX2iHgzaI8="
								"pomodoro.yml":       "YOcZZa/K1gF97q767emPDeoI3E6JjkXYbtdQUssx/ig="
								"pomodoro.yml fixed": "FI7Efsfhb2lPlT1slN/o6Fd4mMaGwBaMNghAm4+JkWM="
							}
							multi_step: {
								hash:       "2NK75N45SDDDPTCF0JAKNTRTT58Q7C1VI5K10B5RH9BTPKUPM3K0===="
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
