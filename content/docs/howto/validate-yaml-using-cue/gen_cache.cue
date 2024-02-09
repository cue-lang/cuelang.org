package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "94M2xI0qqMDS3BSvUxQfL1kjBWkUqcUl92oDjHFZYqc="
								"initial x.cue":  "l2SgXStc8rlBEH0nblXS3UWMSaZBMTGHWv8+rUcxb90="
								"another person": "XrI1qmz7f75hqJhJA3Ae9CewIcouzvRzZVEIW35idZc="
								"fixed yaml":     "qbaxvMS0CymKMA0hllAY3ycEVWn0qWFHlN5z1oVVnIA="
							}
							multi_step: {
								"M5IHAB9G0ME9U198FPCSM69D1RQLI0K4LVQ8R1TJ22SF6BLO2BBG====": [{
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
