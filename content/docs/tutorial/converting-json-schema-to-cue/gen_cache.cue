package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "VgGqPsfqDaZo/HqXlu+zLjGcJNYFxNe3U7kNl+KiQFM="
								"schema.cue":         "mrcv22kWvBfV5zIt0tjLw1ZDXqlRhF56KNG0WR2W4uw="
								"split_pea.yml":      "EeQ4NAPV/KH2TOf+A+cNveydGq0MXdP8ln2XjqAioZg="
								"pomodoro.yml":       "FOxgvc+z0eUWBroOVmv3iEjIEV88u5MuzytRwmoc+5M="
								"pomodoro.yml fixed": "eqm6stV+m2tESXF32uTG45U4gjDLuxQOJulENp4xojI="
							}
							multi_step: {
								hash:       "J3HCQC98G7AHPFVRMLE5IC1LBPIMU7AN5PVA2G4KBDA9A19JL7E0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.2
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
