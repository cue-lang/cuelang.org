package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "6sfFf8leqtbDVC0xDJ8H1+43RT37hvFXuk8N9ZFSPnM="
								"schema.cue":         "TmOwhTxZexMT5wymQV6mj9DhIeRNL/h6KiecRU5i1wQ="
								"split_pea.yml":      "nxTRRPJT1gpx32KW9xjCDgEvGQWZ/7TW/XOic2xYwSM="
								"pomodoro.yml":       "uJwtpCGIZh/jt9N9QMWrXVTnbFIAP4nt4v7xxnm40U4="
								"pomodoro.yml fixed": "tebS4xRXEQxOsc8EN1UguRL1mF0nvD0NzbG6v6ownac="
							}
							multi_step: {
								hash:       "CIO0B2IKENFOTMIH2N7E7QAIA70IJUN2LUOKCGQIT46GL3UG8F0G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.1
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
