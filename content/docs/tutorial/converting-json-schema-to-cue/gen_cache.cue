package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "7w8Ajj7083hhw1KxIBwCToZtIcH5EUEKO2k56T7nz8Q="
								"schema.cue":         "Hx3uARJAFxbqW+VL6XbI11eiktBOD2teI2tMf2PtlKQ="
								"split_pea.yml":      "NXMh2qjn+PblNKITzfija/QNI3VqrRNdAJEFHrrhQbQ="
								"pomodoro.yml":       "Lw2pH3cn62DXUhA+t30A9K+FndhxCqAzJPLfCbUJFdw="
								"pomodoro.yml fixed": "Of0J0GsgUzDe+rFEBmP98QF6A9USBKhnIvFLYT9/e3E="
							}
							multi_step: {
								hash:       "O858UHVMTPG2KD7FN7ORFLBDEL42NB11SKTN08L4MTMFOFF2CIKG===="
								scriptHash: "SHPTQ81E95CP9JF83F3444BQ9IR0272SFCR8SS5QR85P2VR8OGV0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.2.0.20240423155700-1c3f536579cc
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
