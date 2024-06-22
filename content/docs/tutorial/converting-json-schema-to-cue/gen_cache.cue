package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "NsSwsfOmih3vNyWSo5PV/3+imB2mb/pXO7kEKPmJ/kM="
								"schema.cue":         "rnrKTSh9dDQ8HMbQ6U4AJxBu+KU8Yr/cF+C8Z2tjNkc="
								"split_pea.yml":      "SZVBFfagbuLRQaTH4LLzwXmbaCFtlFE96m0NVI6yV2E="
								"pomodoro.yml":       "Z5cdRUWhRZJem0QICD2CW3JCbRpiFnyqxtI8DKehrxI="
								"pomodoro.yml fixed": "t8EmVYALZjz0RSh/YVb+beyC+/kptZbvNk1Jm9hmmb0="
							}
							multi_step: {
								hash:       "5GBPKMUUM5K5BDPT4RVO3B41TPE3K68FTKHVJ5H2NJGK2J5AUMK0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.1
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
