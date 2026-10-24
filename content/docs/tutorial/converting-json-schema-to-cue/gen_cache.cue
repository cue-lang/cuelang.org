package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "8l/at7rGRvJNVN0ZB6fKB5NZX2PjONvGm7INBIt7n7s="
								"schema.cue":         "J03BUImUogsUJTvniCFGZxmaIZ1EP4IE5Us1BX7o4o0="
								"split_pea.yml":      "ni3NiACjGUTh8/cnWVmkoorYK4e7fpb4coJT1GqbUCY="
								"pomodoro.yml":       "U8nDhxXfUo8fwKQMnlII6CJpZijyxcG61JnRmx8rdGM="
								"pomodoro.yml fixed": "7/emyMf0DRemi+HJNpCDDFF/9667oi9IUhW1Jfb+pTo="
							}
							multi_step: {
								hash:       "VNL877IFPBEAHNOD5OFM9I3OV8QK9AUSM635ILAM3VVC941IIS00===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.18.0-rc.1.0.20261023142911-c9393fa32ac5
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
