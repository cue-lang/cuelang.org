package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "AvYegxKHA8OIkZtSZU8DARhz449f8gFOqrXx5pmqWC8="
								"schema.cue":         "Bf91NCuyyXgOrpor4VM6c1pgckEe5C62bUpIueLlvrA="
								"split_pea.yml":      "M/fddUsEt2xAHXlHWHrony6mkJNk8Bv1P5BJpCaOJkE="
								"pomodoro.yml":       "8tBykJ3jwdAGp25pUkmXQ61Wu+otfNK1mwzdaIpCMlA="
								"pomodoro.yml fixed": "CS9/Ag0E7MVbsKXWIV8NXOg7tjAaxKwNdTdjgwvFQZ4="
							}
							multi_step: {
								hash:       "00TKJ0P4OQMTG1L4NGOP0NI53FA0G9KA2AE71T2E7JK2S39AJAQ0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
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
