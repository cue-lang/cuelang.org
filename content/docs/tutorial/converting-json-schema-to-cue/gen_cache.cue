package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ODfIbiM33eRxQgzt7TktoJ9hBQ+chaYFW+dV5o1/jSk="
								"schema.cue":         "cwE9H1iEVmf1429Q8GTaUWOxvO2QCeXpQ8zrwSWoeb0="
								"split_pea.yml":      "yCuEbacUO/OqGt7CNTOZTF8txB2UGG6RlTrKTGASQG8="
								"pomodoro.yml":       "uyLxQ890sApb6aXmHouiYPhy/jl/7KppJvzSyHmNLos="
								"pomodoro.yml fixed": "TpF6MpzsTgnW1H/u1uGOu3690zdWOK/DfjQJCDh3ZAM="
							}
							multi_step: {
								hash:       "P08EUEFM3LEQPT1M42V7T8F3NNTJCC0KG4K635QJDB0OQ5TDO9R0===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.2
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
