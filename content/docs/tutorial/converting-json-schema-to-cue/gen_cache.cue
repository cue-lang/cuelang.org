package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "KVXEkskAbzcb5rv3TGYFBvA+3+KOZdGmOcPWWWqL8Zk="
								"schema.cue":         "A/LQw27pVnJZASQoL6EqhgOqolS1lIwQiF4BqV22D7g="
								"split_pea.yml":      "5QsB++1TCiDNC4a7xXE1lHs/8i//z6pOPqylGeRIdFk="
								"pomodoro.yml":       "lIytbEoQIbDhraYta60x19c9MR0OOcUiBXdlROZaA/c="
								"pomodoro.yml fixed": "lOzfeWenA4/DrlJm2QK1UBXwj000KDMW4z9erPjcIrU="
							}
							multi_step: {
								hash:       "AAE6K89NBDGI9NIF5EJN6TKRDBK2IRIELV65BE7MK3B3LHM0OG30===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.1
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
