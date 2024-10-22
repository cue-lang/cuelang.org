package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "mdJYUbK6bmdAcUOkLjQK95O4ruKzLbmTr1rQlSazJ1s="
								"schema.cue":         "+Jwshy9mpS2F98fj+33RkZivB/PqXGc7iw5/kbO4SLM="
								"split_pea.yml":      "KbWwpb40UzS5vy13j8GBw2OE7/qgXqGjghJE55fdEUw="
								"pomodoro.yml":       "VvsB4WIUsM342K9kCDh3F6z1uWfC6ZTkTRn5SsRu14E="
								"pomodoro.yml fixed": "M50PohNX/cXvShWfep3fTJp+zpOoCjaLhTc8ux4g+DQ="
							}
							multi_step: {
								hash:       "4U2FAREAJV4AHTSS70RE2211BBRAH8NIT2PF1KISNALS5GNOSPJG===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.1
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
											    ./schema.cue:10:17
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
