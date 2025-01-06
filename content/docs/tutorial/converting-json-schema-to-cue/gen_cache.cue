package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "SXYG4+7bne9c4WNszTQVJdSu5dcfJ6R/P3RUHhnMrog="
								"schema.cue":         "liT1XPatbCMez7ZKMfhtSLs8/5M4mcQ/GPvfCXrd2zc="
								"split_pea.yml":      "Xgk23G6eF5JrzNFyEz2Mem7vXz7vvW4c+s1ce5nCOow="
								"pomodoro.yml":       "sL2rfdCA5AsBKYnql7M49fHCIpb4tEOwqlHNgOmGxRI="
								"pomodoro.yml fixed": "GNcefYQrkHu72R0DWcXhdSol2Rm1ersFnTPFu66Fodo="
							}
							multi_step: {
								hash:       "H3T1A24DL1Q4KAH5K6R36R5G5D4BCCJ5IN5SFGJU1A9H235S2RRG===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.1
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
											    ./schema.cue:12:17
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
