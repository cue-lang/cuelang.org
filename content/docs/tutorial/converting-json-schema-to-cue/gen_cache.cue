package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "dAQDQFkVN84h8G7qUVFrdWBSh+Cgdb2HYlmtN06z5/8="
								"schema.cue":         "lRZOFqOCA5/Go+9BjiEVpfKAWXgm01xfb+BPfT2xZmg="
								"split_pea.yml":      "WYMHrZT5sskknY/LPH9wOqrk2xelRLSHYOTVCQBh5cg="
								"pomodoro.yml":       "njtb5BZlCBoIa3Mfnj0d1DmZIL8tjN0koncUeVC9Nyo="
								"pomodoro.yml fixed": "9Nr81AoAOm2FL8i+IX8b8w7a6osT8KyVqGPlTdKZZ/Y="
							}
							multi_step: {
								hash:       "6SGSPDQNRNDSQMJJGKN7L1P7VRS4A2B2TS77TQ8O9M2S9V6OAG2G===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-alpha.1.0.20241220130530-e4c4b8e8a15f
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
											    ./schema.cue:13:17
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
