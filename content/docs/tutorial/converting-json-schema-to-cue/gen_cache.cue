package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ghEcpFWdeUmDaGUR6eiTTgjLWeM8NDa9zVmeYd8arwg="
								"schema.cue":         "FoWqpQ6gVpipj4d2ajNvEgfdJSJt6UOIHNrZEXULoTM="
								"split_pea.yml":      "+CDGl06JnHE8ETgymabYHf3LvdhuvjNxM2IRlctaZ8c="
								"pomodoro.yml":       "HlaFbKyyxJj0J/+eRjjiHxKl7Co75uRQyvyIXe3Alac="
								"pomodoro.yml fixed": "jlO2jCtEn88ZZTioZj96cIxgMf0IQa2MIE7DIl3KnSw="
							}
							multi_step: {
								hash:       "GQIJQTK9L05NQFOJKLPC6R8FUIBFFPNO127E5PPMFJGRGJ6PNI0G===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.3.0.20240501134849-612f1aed155f
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
