package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Zn1rBLcE0sWzKK1gnFiOakV6UlM5GJV05VdFjA0P+Us="
								"schema.cue":         "rCVUYPVOXUZ8Wqglq0t61e1JmHojRzfecvloHI3oNko="
								"split_pea.yml":      "eeCQWCpHC+xfT+4X1KDbog36g0RGJQYCTxJ3T9cnxBg="
								"pomodoro.yml":       "BOncXSRKJ0LX+N66OwGcrt2zoL1lqGkktoC6zdI9w9g="
								"pomodoro.yml fixed": "roPSzb2zA9wxWgoGDHvyQCAtCL5wmkoR3oW3BRdjJaM="
							}
							multi_step: {
								hash:       "EV7JJFHUQV15TB6MK63U3CQFBQG9T6IMDV7BLG5E5K1VIMSCR1AG===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
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
