package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "XsdXDf1HqfGEYAY5mGOGwk1eTo4TUR5adbdhtSeD9mI="
								"x.cue":        "HL5YG6YB24e4glczrIvXh90hkbwxzpwSegxMBqT+HzA="
								"x.json v2":    "MQruo9HPE1ZwQIJ1jdP4SAp9pt1nj1mxJOUW/thP9Oc="
								"fixed x.json": "tgHqrdp4yq0lPV1fJ2w0LzDwRGOEAJYkBQ8Y7juaae0="
							}
							multi_step: {
								hash:       "PU70Q5H8D7Q7AOBQP830HLT2BCAFA96COJHIH6H1H90SQ6HQD690===="
								scriptHash: "810GSA4MKQI10E7C2KVS56R280CO97K2P1T548JPALUN13DF52DG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
