package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "cRR0XlugL2GNQZvU2hEvCi3WU6gx8RWcIqhuPIMIG4k="
								"schema.cue":         "TzqKntV8EIKtX2pM10OWziM5rrmM+qBw2odj9tSRpdA="
								"split_pea.yml":      "S1B3opyP7vqrvz/q/9m8sNMQBE5D7IvuHhfLtNZkk9I="
								"pomodoro.yml":       "XfGf20kf6gaeba1Dee06xixUvIBjCW0uhkPG997Vz6M="
								"pomodoro.yml fixed": "DuRNv6oVclpnEohgNtMK+uJ/TJLPX3aDEXY7VDVSm1c="
							}
							multi_step: {
								hash:       "UQ4U3I32AD4J5EVJTOF25B6DM6J54H7HVPKOKVOF0O0T5JRH71A0===="
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
