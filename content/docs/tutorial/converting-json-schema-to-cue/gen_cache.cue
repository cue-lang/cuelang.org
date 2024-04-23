package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "QwGPhvTVsa41YmEPmD+5ohPDgQNk0GnGe23hUWMMCmI="
								"schema.cue":         "M63d0wyVx82lsDuiPXGdFufS4mkrKCDpfSn7Asb9aqQ="
								"split_pea.yml":      "vqdTmFnJPw7y9aDevFgdMnQKzgdPwCxdVuWQ9jnHpj8="
								"pomodoro.yml":       "jlcamAdLezHTvMKG1kRGFddpIiXrMFMVGV45cyhsXoY="
								"pomodoro.yml fixed": "hGHl+Z9sAPBBc0N71AuaWWKRZ6VDWkPl7OCt9myj/Xc="
							}
							multi_step: {
								hash:       "OHCOROGJT0K9EEL9TGVDNNTQ49FSQ3S6HTTRE1V0PQ06PL4J8A6G===="
								scriptHash: "371283LR856JI9DINL6CM8PG1SOSHKKGI610TKJJNU4V9CL0M36G===="
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
