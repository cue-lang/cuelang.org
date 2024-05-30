package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Bg6+raync+gqghxq3OKEAtrK3GSHNPBVBQubrr8fCtw="
								"schema.cue":         "FR3oDqv1bJoIyKhQBgypJe+vi0dZlbwEXxMHNoc/U10="
								"split_pea.yml":      "pHiV5AFk+voZISHpMflf+OY+/2899ocNpxCw4Hi5OEM="
								"pomodoro.yml":       "HebQswUBfK820F1w8XLESd5Icr9C/Swf0TylZX4FxNk="
								"pomodoro.yml fixed": "Ysc7GIu4FaZExzhXfmFLkRvl1vaCrqyjFsT1sWqTYDo="
							}
							multi_step: {
								hash:       "5DPD40G8MQFJRHRF4A6K8LUAD5V40453RIQVQV79TIDAGHCP3GEG===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.5.0.20240530095928-7ab80025ba4b
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
