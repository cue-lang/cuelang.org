package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "17TYeV/ErqtVnWQrLVO34CzWxI6ojgQWFO8+d1DK9o4="
								"schema.cue":         "krdhdHGLHEL3FcfBM5lGI0XPx0g90vyIeDQ84lohEhI="
								"split_pea.yml":      "hRz7Q1DqaipbYOYEcxuo63NmbScJhD7Yy1TI3QrvDrQ="
								"pomodoro.yml":       "HuFZludkb7r9irQaAd0y+z0Xe6eXDuiKK7u0hS3aK0k="
								"pomodoro.yml fixed": "naczOTHgVbXZ9DRFA44yA+aPWMpi2dCLUzzuOru/MlU="
							}
							multi_step: {
								hash:       "RP7BGLU4NCMLRGHBRD4AGVI0B3LQ2HTD58AA8HFAIT16QH21G4JG===="
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
