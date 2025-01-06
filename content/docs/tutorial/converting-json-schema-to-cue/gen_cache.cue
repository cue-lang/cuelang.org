package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "gkxnXHqMi6pattVutsUfhHR57vGEM0Q6pN4qvjrtuMM="
								"schema.cue":         "Dva5LXlTCETkuhT19afliUAXPJYvxBzB3ZLhqC5S9UI="
								"split_pea.yml":      "gIcf3WC+M4tjKroKU7FiJKHL1vkjtPNFevtfYa38380="
								"pomodoro.yml":       "s8Ofw1ocb+7g+ds+uTk8GFY1ckTvfHAkWjT7K0ZbEH8="
								"pomodoro.yml fixed": "vu/TDkO+wTXYKizuHCGE22b9xxoFXNyvzGnG8yukuYw="
							}
							multi_step: {
								hash:       "PNS4MCRCQDU88H77FD7K4R0MQDOKV7BKN2RF0ROP8LI0NPT9I80G===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.1
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
											    ./schema.cue:12:17
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
