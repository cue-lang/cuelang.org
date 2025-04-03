package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "rrnaMdyBae2XoojHH/G+13Z1a3nxIIHbEKH4Fq9kOmE="
								"schema.cue":         "0qjsWSFJUZfnQeY61QrOF1cJ2kBGhtUKrm0FEBvAedc="
								"split_pea.yml":      "YsvsocQx/RlRE/Bb/g+YjMRD60HGA2AxVEKNKcd0K8c="
								"pomodoro.yml":       "XskkdkRO9aCyo/Nu16bTIxtLNNgfEA1oyRslphN1PSg="
								"pomodoro.yml fixed": "ImMoxCrnzmhj7+syBUnb+OFiuYM/lXY33kUbz3OOsd0="
							}
							multi_step: {
								hash:       "GTJOP6S7POK0UVN7T6KK3IV2TGV363801NQ9704H2E7MC0NO0D50===="
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
