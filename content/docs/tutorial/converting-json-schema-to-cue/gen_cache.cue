package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "8eymnLt7X/Z9rGTj7uPtQmLlkhzprgc5rOBjgYqslnQ="
								"schema.cue":         "EJ4N1OkorGxcU4n5BHdVgba+25w+E9iW9yDrlX7nYbI="
								"split_pea.yml":      "uYdCXpfX/A3lhcfn7UBIVlS2WpIQ0X2S0OWkrtBMq1U="
								"pomodoro.yml":       "D6S7sSnu6GNWAy/a6DE12N+i+V/2k08jwp9Z9g8Y/eI="
								"pomodoro.yml fixed": "Kb/+FDrNTw9kA8Cfw9QCbvmJqXxgjDOMmAuh4kRqXG4="
							}
							multi_step: {
								hash:       "6578OTTJKIEK6CJI1HMKC8DTLCMETUT026M4EJPNOH695B90FSU0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.4.0.20240516121848-1ad8c5209979
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
