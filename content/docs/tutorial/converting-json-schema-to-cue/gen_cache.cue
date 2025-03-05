package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "UpBOjRpae1QledRFZ4oRciPxLiKK39BeLcZkYrAzpLU="
								"schema.cue":         "o8uG6biS122K0VNc0tAeAb3XoitxzpAHSFIhTvJ8+jE="
								"split_pea.yml":      "MNHDZpfjIohPw9yKol/ZZTtKT7Tf0aLxd9AfEw7bJuc="
								"pomodoro.yml":       "0bCXyhQsrZl36kFghRt/8W9CbvRwmbNEMB6yf0GUYZ0="
								"pomodoro.yml fixed": "H7BeIlJHGzBWLBS2WaGQePWMcLoB5LYgwqCIWo25ksk="
							}
							multi_step: {
								hash:       "RIER7636M6BNT73T6IUC6OJAT2L1T70SLFOL66GJQHE0FO6KFAVG===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-0.dev.0.20250305124614-153fc8a559ad
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
