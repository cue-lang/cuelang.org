package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "EBeyGssD2C03rNKYFFO49KRaPQw63GRmD2bh+sJA48M="
								"schema.cue":         "4P+/hbBV9BvNgAUDUs5s0WQjehl8Q7WHqSaf1Ul1XPM="
								"split_pea.yml":      "qc8IHEh5Jwf51kLs+9brRP/aVBbpMah7hf77c+9XsL8="
								"pomodoro.yml":       "+BM3AE9MfsBWZXMVOyDlFU3V8UmVb25ZZW6bSHdXLI8="
								"pomodoro.yml fixed": "+yv0DBkXqzNQWvAkpMOOPI9uIzw3wi1oSRp0RSjxMMY="
							}
							multi_step: {
								hash:       "IG0KH7L2ORNQU2SK9M83E3PKSQVMN0P2D9CK1I1UGK21RS8G4P4G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.2
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
