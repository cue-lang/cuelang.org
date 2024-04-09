package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Zmw+yqdD3R2tQ2LIj79AF4xvInaQmvzl7L3milYWWFc="
								"schema.cue":         "RT5M8bHsGoqmPQ5izBThNhSo3cwG5wHT251siZGKpLY="
								"split_pea.yml":      "Ef06vWzZe0Na7qommCI0qxfIg1Jwllt/mi5D1Ro2uzE="
								"pomodoro.yml":       "BtFLRbgVI2bf3fBm1agOFlLODLR+E/93khARCtsgOzA="
								"pomodoro.yml fixed": "V3gqbNIKEuwqVG6vQ/IGc89qp+X3ntcH2lJxsiyEGpM="
							}
							multi_step: {
								hash:       "94I4I85BVH1OTEJ5EFTRNGV0ERM83IT0UUIMMLSLT2PFU8IDPHM0===="
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
