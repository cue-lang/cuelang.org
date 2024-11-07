package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "4LcELoYWs6wb9UEjPgRbgAH/AjyfC/pIF8rTez31NSk="
								"schema.cue":         "fgOfrEtodAz1HzL1xTCo0kT35QPQhE792xL8tADlQxc="
								"split_pea.yml":      "d4jwRsPqKFcACbDAj8h02zX6zQyiVhVLJ3XyeKuoHK4="
								"pomodoro.yml":       "EfgNaIE3EJY6cVdJu7bjAaS1rCbgMlylw4YDSNHbauM="
								"pomodoro.yml fixed": "ZXGGXgG4wRLQLVO0ZboNgUN3gntHogJs5deIl3hqJos="
							}
							multi_step: {
								hash:       "5TSAFK0KK5KKOC0RDAJN93CNHS1T30N39OMH37E93DO26EBI8B5G===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.1
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
											    ./schema.cue:10:17
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
