package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "FaZjU2mHg9Tem9eZNtYeettg7qLQzQ8vKgJRWtHqPdg="
								"schema.cue":         "30pDOPFHrykRmeMYZBey7v0Jf/+6OGHqPzU8SeESHpo="
								"split_pea.yml":      "k66xhngIs5IEHR00HCc/1tuaG2+wpriNHX56lUlGzGA="
								"pomodoro.yml":       "/oOV8oJmXftAyioULjwlkdZiHwgWHqYONazUzQxeXJg="
								"pomodoro.yml fixed": "PJMVC3XG3YONBJVovmoNYtAECbPF2q4trgwoZ2iXk1o="
							}
							multi_step: {
								hash:       "K73S71AJN2FGI3PVF16M2SOUP6GD3D1N51IAQ2PA5SD6QRLKCF0G===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
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
