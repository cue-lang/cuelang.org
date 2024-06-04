package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "EdKp00z64ds0omyBROy/2oEikNJObRXk0+ftD/9nSFc="
								"schema.cue":         "B+hwUumjTISm+qZET7n6LjK/AqGvL6aYkgODdywvaoE="
								"split_pea.yml":      "M7jXLZXfuORoSsuWbemrohH+dihitFAdUGQjSmNV7VI="
								"pomodoro.yml":       "DIauAfDKAAL/oOuTFzfIelfJUoXmsbOs8PNnRGFe28A="
								"pomodoro.yml fixed": "xhVNdYftbYq58CWB++VbHAMR1IG+5xgWswxX/357CPk="
							}
							multi_step: {
								hash:       "PA8VOERAVP34MO4993TG8B5L3DT0S0DU6O9KPJ3SVNM1HEM2TID0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-rc.1
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
