package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "UDwMPvv6Oeyo0pHsVopXtkTHEzbJClKdFvCDnj8n8lk="
								"schema.cue":         "4X4lL5XBGSxYhimtwRxsr/HPonCY6slP2f9K8ZrmLr4="
								"split_pea.yml":      "PMjTr3sFkjHaYcGUkgZ+/iqvacKeWrjOGhy3n3lIXjU="
								"pomodoro.yml":       "lVkVS2UF8qqru6dtgBhrpfP5cBasVOCU5x9gndmKvN0="
								"pomodoro.yml fixed": "t5EYYomF6bdA1y46JTvF2K36X6etoLJjoCXpIfHU6uA="
							}
							multi_step: {
								hash:       "CC4FEEF3RLTELUDL25KPUFGDLOSCQLSVKD5S39JEG0980LSBF270===="
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
