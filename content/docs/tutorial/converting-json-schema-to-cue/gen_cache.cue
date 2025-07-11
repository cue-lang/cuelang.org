package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "mI5rQyhFYh+1on5caGDGUvORw3BDRZHMgMLjCtDSSyw="
								"schema.cue":         "NAHBDihnmEgVYemVBK3opa5iodBaegk/puVYbGMe8Ws="
								"split_pea.yml":      "w4nzOOwMJEOK56nVcOfqIdHXNatP9Dx0/Nx6dTuYlDI="
								"pomodoro.yml":       "jqNGM9Q7cz0i3w0gjHgTROrsw4rICvkb8xGF6JemmHI="
								"pomodoro.yml fixed": "bZ75+xq2TEZS2tVDxd8Li9XBYtTyqg7To5QZMlLXegI="
							}
							multi_step: {
								hash:       "05A49MUL8DVF0HGQT04JLPCAA5CBJ4KIR5U2SSNAOO5563ROF8BG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0-alpha.2.0.20250711132054-9ca9609cf83c
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
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
