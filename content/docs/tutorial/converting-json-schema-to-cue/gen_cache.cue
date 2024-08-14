package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "k7bt0SuZTxrmeZ6QsLpOkzF9nTMnpNWnUSHdm3e3bz8="
								"schema.cue":         "Blk+QcZPFXxtG/wWN7OQ62PR17XjG3JJdWhoYFeNq5g="
								"split_pea.yml":      "fyJJ9U9ioxsLuTWKg8rTDZP/V2i0vzpaObwUvgJxArA="
								"pomodoro.yml":       "B+hQcNzbML157JhAOPvjaIDKjQkEqJ90CLhdgVD3M8E="
								"pomodoro.yml fixed": "nvKgs9iAVA0OqqXy8U4OKZV3S0M8+EgwpUSQJt+GUjU="
							}
							multi_step: {
								hash:       "I699J079SN1P9CGHL3KTIETTPAAIK2LLQTT5P5KO6FD1V5P8FHTG===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
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
