package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "mUo1iWk/7GI8KzVud7t33p3VncbqGrq1hHpUwLMmfQA="
								"schema.cue":         "xNBnN+zRUfXBoExbgecvuDou9SBlBZD6fwX85Mg54i8="
								"split_pea.yml":      "nmSx7onMxICSj8XZ65b2Bk4MzGlvHCReGnTgbMgmZcc="
								"pomodoro.yml":       "a3LfcybK8s2R4URUK9xySg8n87U5ZuxSAhBZWz18VIk="
								"pomodoro.yml fixed": "vFweVIVFFzDi9h3do6fvFVr5jlclpqSszTi2y3MwWrU="
							}
							multi_step: {
								hash:       "NFGNCE42OO1NL7A6ORKMC5LDIM6PA96RQ8KA7HBS1DHSKIUC5G0G===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-rc.1.0.20240605220750-a2292241985b
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
