package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "p++97Fce64rKRxZNBvPXLpoz3tgSYIvz3e+PuMG0lns="
								"schema.cue":         "Tnr472mRfIz0Dzv0OKpwp0Dc1vgANfeTkt8KFmTDNLs="
								"split_pea.yml":      "Qsr9MPlQeE9XCs5UZHsoJhMNFEbltn1gyuYfO1FhjEk="
								"pomodoro.yml":       "nflq2VIvl3tL3nVfyFH2Tq5CzVyVIlEY2Qsn/ENvBy0="
								"pomodoro.yml fixed": "mjwuf91OhUYxvNBXenUgHKhsawWqQ1b6a186Y5WIWNU="
							}
							multi_step: {
								hash:       "R778SLLBFVCVQD7TKDSQSL693UKAH4TJ1AOVSHONG1OPFKE3BGBG===="
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
