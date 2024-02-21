package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "57b9KFBQgn2SwvCP/MzqgBkjZvSstZyrs/tc7EPSY/o="
								"initial x.cue":  "R+U5CurmV1h0MEgx0z9Ba/jwN8uVLkBBJGZk+KBGcWw="
								"another person": "R7iOj7VVjXMklvVUUnZiK9WcHldrUXbPgQzH6WKRqFU="
								"fixed yaml":     "0nHXsdWGQXj/2kuuclkOus11gmNHT/D5ZzVh/WGA8LE="
							}
							multi_step: {
								"SA0SJ09GRRPBMQ8HP3LFUU96HT546NQ9DFD0L7S8LNMIAU1QGR40====": [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
