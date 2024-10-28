package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "PjxwXUt6DDy5MUd1fB/9+I+R3VD7HfqDhbhKwdBMta4="
								"schema.cue":         "SPuLgAJ7wRscFUd32zNNfAbDIqOAWPduFfj9uX0PXjs="
								"split_pea.yml":      "7YIodbbspJG/75Hogc6rkU0kAiRCjpTW7nkb8L/WqqM="
								"pomodoro.yml":       "txueBwEl/Zy5XgeoGofAdM1PU+Rp2QSMUXVegpdElhw="
								"pomodoro.yml fixed": "WR67uoavfLfcFFinR+ff33EN8MPj9SChDyo0DFh82Js="
							}
							multi_step: {
								hash:       "4ASUJ9LDQG4CU9S06EAV8VU6F3JI7F5EAEO3G8G0EE7BBJF9AT5G===="
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
