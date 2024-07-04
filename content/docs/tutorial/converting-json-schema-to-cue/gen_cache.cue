package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "gcdpa+mwyXtnRza3bMBokJ5NJv9mAnIvhOqh7HV+YwU="
								"schema.cue":         "0Azp7tJtPgw6vENYQP5ULqQ/Vr2WA6Y/AEpjzpD1UfQ="
								"split_pea.yml":      "hSCRaXww6fc9upJBuk2Ph5mkSy1cZ1pb43OwLuwGN48="
								"pomodoro.yml":       "HGO1j31+wAiyx+RLVGi8VhUN0z1NYIjqBe53L9kyXb8="
								"pomodoro.yml fixed": "PmyN+ByYiCtPN4YCVWVhZEFN0WzBrwkpLZspFgXOTGM="
							}
							multi_step: {
								hash:       "6VARE062JKCFKDI6E6NDFGTBO4TT3691LEILJ0O94V50MPQHIDP0===="
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
