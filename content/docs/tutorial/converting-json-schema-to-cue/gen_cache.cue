package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "DO3fhhffI9GRLOgN2g5X4T55pdJIl7t/4ITU9Kg6bcw="
								"schema.cue":         "rWU5+l1ZbH7ooFQtJiY56IpV+6eOPK+vZvZTetY5oMo="
								"split_pea.yml":      "IhPzlT3noDtJMKh/FR5Df1AaP8yh4GKm6oq2pYvUs2k="
								"pomodoro.yml":       "Gta9rsoZNaqc2yBirSueRBYGHCgr8j3EcgU+OWAUOZ4="
								"pomodoro.yml fixed": "fp3GYCeSLQLrPaX8HjJPKZgNemTsg5a0cYcie6iUxZU="
							}
							multi_step: {
								hash:       "OOB5RBDTAMR2EI59BCOGBRK4G9R1N3VATGSDSOJ4RE0SM9SKUTU0===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
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
											    ./schema.cue:13:17
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
