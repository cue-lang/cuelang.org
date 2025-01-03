package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Y+Bqp/XDrb5VHCxJbzY0Sg/KZmxfFrXRs5i7Hl8RzzE="
								"schema.cue":         "y7zwkJtO+chs2UTkdpKeMg/yPUjU99fmqF9UJvySlEQ="
								"split_pea.yml":      "Cavq/fGXalQczqM6u1fHhDDWHYCQJz4kABcfOScGbr0="
								"pomodoro.yml":       "/b61xIqPSVdh1sWORJSLk579SbKaUJ50KXvDVl6A3AQ="
								"pomodoro.yml fixed": "gfWyWCEPIiy6KVRhP2hNGfVBAe27djeGsagH5/Fa81k="
							}
							multi_step: {
								hash:       "D3L5RPTI8T9HHCEDQA3JPQ3RSEOVR1SK5EN21ETQSCMC1BSGPP3G===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.1
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
