package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "9SFZFpj6Wt86UOBqkS+BHL6yXa3U52YTvO4sZ1u+G34="
								"schema.cue":         "/Bsr8IvDWnFFS2AH5Sv3PlkbOEcxZy4gVmz4lS7KTIE="
								"split_pea.yml":      "zvHL8LoNXDi0AXG3v+fLO7TP3dzbPmOB8oT9W+TuySg="
								"pomodoro.yml":       "mTgW159lZLxS+5yc8fwXD+P8IsDeUmKcmVQGFlW/E5A="
								"pomodoro.yml fixed": "swOqz/LxYV5EHX1nZG62fHwOEaZKPeZGbKc4ZMWBS1c="
							}
							multi_step: {
								hash:       "RDV2QD6KL98NH4IE8TEQD91PNHLGCSBAAQ3AASH2BOV11RJUECPG===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
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
											    ./schema.cue:13:17
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
