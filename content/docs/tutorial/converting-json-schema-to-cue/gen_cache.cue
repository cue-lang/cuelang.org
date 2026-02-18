package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "VgZoQdENrWzWfJfiuHNr5katsotd4M+PrXSgIRX010Q="
								"schema.cue":         "y7gHi2xIeY4/PZEcCT5qBnx69cPPOcb8kn2g47DxQ4I="
								"split_pea.yml":      "/ESAjFrDFijaKti7vVb7JH95EUjCWXFZmVunESpKxAo="
								"pomodoro.yml":       "R2WZWPreCgrRG89IPIQquPBZP2hNf5FNhnAOLrLjZDI="
								"pomodoro.yml fixed": "DoyLxtJ+WF4CqOLYnoBzrqe/eBZtjcqHC6H7lBCwF6k="
							}
							multi_step: {
								hash:       "481GU7QMHRFMLLVG0NNVAGDVOHLAP9L06K82E4JVR9GJRCOFJKA0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.4
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
