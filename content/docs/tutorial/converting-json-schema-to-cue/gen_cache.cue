package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "8YytwGlfdWuAz0i+TMo8OPJ3pPi9M++zqqD9FTuYLzI="
								"schema.cue":         "diwpLkn2x8KthNdgbPZRO8GET8LxWUxJTaRt/+kZLMk="
								"split_pea.yml":      "G0lS+PuAiE76yNAHIT71TSNWTSfTRIfOlTuMQIFFPZI="
								"pomodoro.yml":       "Luy6O3R/hhzLScuGvMCE5pBV2br5diZHht+nU0IkW9Q="
								"pomodoro.yml fixed": "j8huUMXulTj1s3i6gvvDrg7phd1p5rzGYEMTnMqXURM="
							}
							multi_step: {
								hash:       "VU46BV283DCJ3TNA34QM47UTB7HAASLRQ6K2TM8E9EAJKCQT6TMG===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.5
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
