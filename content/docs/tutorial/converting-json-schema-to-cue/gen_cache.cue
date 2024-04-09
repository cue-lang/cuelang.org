package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "N05ZKfvgqLpevo0Vb3ybjWC8PZl0eXtR5QqlwUxvCXA="
								"schema.cue":         "VOnpYahQbQ8+rhpwT3/dp6Q/FkbnC4niByZhIYzEor4="
								"split_pea.yml":      "YhV57fcvrQGMDN4dfNrv+hcUoTXN6pDqB1L1A7umqmo="
								"pomodoro.yml":       "tOjeCQ7sIo9PlczHrkrwOEsirjC4udNQyYP39kHn8xg="
								"pomodoro.yml fixed": "axkSP3vONRZIjAbkxgOQzSkAxqpljzg8w/IhtzLwUko="
							}
							multi_step: {
								hash:       "APIUFPHBRUH75K2SLK4J9HRM6N83KEPDD86F37M1T2H6D0JUK26G===="
								scriptHash: "SHPTQ81E95CP9JF83F3444BQ9IR0272SFCR8SS5QR85P2VR8OGV0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.8.0
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
