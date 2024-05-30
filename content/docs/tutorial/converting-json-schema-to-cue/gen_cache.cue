package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ZBBpVHfGT5/efyvUCibUey73XaNK9qB3UJVpkPWHX98="
								"schema.cue":         "efbgU6qowufyerv5IScwB4ErEOQmALQqp3ZKrQlSNts="
								"split_pea.yml":      "IUmtVRsWea08ZWE5fViWpFaiXEqo5h0Fqy9JGeq9YRM="
								"pomodoro.yml":       "7HU6q8n2M/wUh+tSE7j0h1LAJUPR3LzpIRjI0TI0lDU="
								"pomodoro.yml fixed": "2qgRnb8oRZOraXIQ2HkoBuuSVknPh5EBPc/nvREuA+0="
							}
							multi_step: {
								hash:       "QVUES8VH543I8RBPKSDBFUA6NDPR4V6LHELFK2FLCO8H79IQ79O0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.5.0.20240530144752-6cd7bbf31614
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
