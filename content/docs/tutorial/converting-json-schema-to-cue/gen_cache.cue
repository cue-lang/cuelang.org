package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "IfoN7kUysemwqA4Izh6xXaqnWKYorHzVP+3zxmLUoCU="
								"schema.cue":         "BkkgVLNAyHLYy4LSkbkg9ieEO8AfcdckB3SVYM2Zkxk="
								"split_pea.yml":      "i3EOU9FE78SF/QBdpiJEzFVySKF3Iy/SF3MnMDUR5YM="
								"pomodoro.yml":       "jGihAe5pXljdkAAtHeZCSbhIsNxqMClaAeoaHhX3I/c="
								"pomodoro.yml fixed": "ThxnAMXrxetmkeetyhhQv2Z2c2l4Rp1PO/Yn2zMSyK0="
							}
							multi_step: {
								hash:       "2FB7PGVO79AG78JJRSVH73SVPQEC7VTG4E4A6536STD2FSBTHSHG===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0
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
