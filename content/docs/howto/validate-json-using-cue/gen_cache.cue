package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "9Ksv2J6WYCZayy84QFL64Y4QnFP6T7rN6ZxEC7h4n7E="
								"x.cue":        "yec3PqFQySOzQFvvGsTUOU1EQqGPTQmWPz6tR1y5AZ8="
								"x.json v2":    "O2E14/vt7NX71Kzf9jVtg6VeZtiZuRrx4QtFCLS5cKo="
								"fixed x.json": "NuLP7NEmr8fzPi1DHnhiJV/C65ML2C32h9ZRHytdsCM="
							}
							multi_step: {
								hash:       "QFP5FH508VAS3CCJABE8AUKPOIR8552IL6BN9TVPO8KKGM3SUP50===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
