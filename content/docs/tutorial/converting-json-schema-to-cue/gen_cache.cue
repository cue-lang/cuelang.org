package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "y57QIg17WTNHSVPC8oDVbhJ1SyNP87Wm3UIUIi2xQ98="
								"schema.cue":         "ixfcNTIS3PdEMtqQ4PwBWZwKjhMu14k/3x9BJdQdiSU="
								"split_pea.yml":      "yeSzyYeDAtkvtdpZEV8Ycic0t6SwE7l4vljxQOkUJpc="
								"pomodoro.yml":       "axcPnWeixrZy8KQWK+9Kfd+quFYou2S6YMbtnbfWQZ8="
								"pomodoro.yml fixed": "LonyR4GIxlCn0Rt8ZHHQtQhuesWChqyyUbGzOlLNNuo="
							}
							multi_step: {
								hash:       "S31GU7OR5UCHUKCNQHEVJ36AL8B8G2C8AO46702U6U2O065VKLB0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.2
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
