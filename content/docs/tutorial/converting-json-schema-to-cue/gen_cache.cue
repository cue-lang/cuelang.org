package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "edxT38asWB8O8aBpUUF+ui9YgGcTlIWrBHRJ8k9IKEM="
								"schema.cue":         "V8NMJkSDlxolMwyU4PDaZmT97mmcxFK72sZ6a/4Eekg="
								"split_pea.yml":      "FVQPV63XoOzGjb7kE/sZyI4pfadoxIIkCxMcyQeBw9U="
								"pomodoro.yml":       "foo4Z/O3DfN8w3R+8k5XlmhfwETm38o1n9N5QDX4vLY="
								"pomodoro.yml fixed": "tmFv/c7zrV2c1OZBE/KGUptwLmHYtW1d2DGDJvpqJgw="
							}
							multi_step: {
								hash:       "JUQF471CHTA09B277F9SDEJ4T6J02695IPSOEQKUEH15VA2ULL1G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.2
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
