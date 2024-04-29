package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "1tkl9+vK4k/p/lTJ5p19vqHMxezjg4IfW1/ec6n9zeo="
								"schema.cue":         "WnEgxNG3ISiPGvsPM0D+d9+y6RKqtWrNB2JmQpwj1mc="
								"split_pea.yml":      "ZA/dGE4vAaxUo+hH6zg4PuV0COu1jVntl4G+JOk9RaA="
								"pomodoro.yml":       "5YndsSi3pYQFvWTau1Gdptc7aiASw2ruFCapYVXR+Co="
								"pomodoro.yml fixed": "Yct04k6z8pjA7h/PBJMPCXU7vTzY6LkQLV105y7JEvw="
							}
							multi_step: {
								hash:       "05MFKTQKTA7ARP5K4S3SKRJ1N4RNECEEBRREFJUSRJH3PE7GNHE0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.3
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
