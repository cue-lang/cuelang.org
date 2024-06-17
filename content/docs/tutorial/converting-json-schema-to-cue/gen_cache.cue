package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "S7gzUULeqF49j56n2ClVeHr4KLE2tu77lDWjF6tL+wk="
								"schema.cue":         "nazaRUxZ1WeIA4cSiugUv+RSytW66dTSy8Ktg2i4PK8="
								"split_pea.yml":      "bBQRo4BdNEjVlfMJRtlZrcvlx2D/13zoeo+P4paJyac="
								"pomodoro.yml":       "pRieBCjAOIjAB3WzHtVbTmtnX+3y3E7ONgVAw/JrkIY="
								"pomodoro.yml fixed": "cj2hU9Dw1YGaB3O8VNddsFm2ZWcQupJrfi7CYs/NvuQ="
							}
							multi_step: {
								hash:       "O6FTFN02DBEOV7VKMKLJHFA4P51GAJJ076PFRHPD48V4EB2HARQ0===="
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
