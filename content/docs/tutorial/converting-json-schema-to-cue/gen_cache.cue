package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "jPck6EikrdbPxHgmpdvDmOCn+v6hTxa5t5omyW64UmU="
								"schema.cue":         "ChQj3qO/IlY42dZ6BK5x/LiWGXWn0aQbvcIaZPdmyTI="
								"split_pea.yml":      "7zjfyA1dPg3QYgWGEFqJ2yEQfKRKbgRAKlpsYfwQ1Yw="
								"pomodoro.yml":       "MeYI7DcDdbIsSbTFzyVPDiqwR2JFwmdhYBC/6hNprpg="
								"pomodoro.yml fixed": "9cav9+sAWL7S7Kifou2Rbkuc6xsH1vMfJjPxT41T+IQ="
							}
							multi_step: {
								hash:       "DJC2MK6160T6NNJJOG7V67SI642S04B5GFBOUFJK6PC2O3HV2F9G===="
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
