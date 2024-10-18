package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "MioOowbfHs9TPuKZanmiU1P4E8lPVkhdVrZp4xlGf6o="
								"schema.cue":         "NkSwp4APgEmXecWyR/5wnjda9/UQkuqyzCEnr/loGy0="
								"split_pea.yml":      "vrIMX1fXcWeP0Y7PuQcTRSnFov1Ew0pDLu+8pzDWGpY="
								"pomodoro.yml":       "yisppuLv5YXb9ob0RXbCB/3F+YNAkoCYniaEZbPfXRU="
								"pomodoro.yml fixed": "cuM7nBMXulTqCXiZoxA9puMYi+LmHFKxT8LCr20RkiE="
							}
							multi_step: {
								hash:       "5KCFLFEGR4I870KKK398MDIG27F3EDMQSCSU97MFD0G6P97POI60===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-alpha.3.0.20241018151444-6e0525b34633
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
