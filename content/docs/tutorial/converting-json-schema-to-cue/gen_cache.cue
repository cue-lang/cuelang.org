package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "jOtweHpQUPN4illqFNbfbEXimplE5/QrPqYZOxKyIuM="
								"schema.cue":         "uY6Xlzah2fzcjwEGooDVJMb18lUqgM0Vs41eE578XQg="
								"split_pea.yml":      "DtryxuAccoeXmeq/FgsmMZ2znQJZ598YRzmzMTCirrs="
								"pomodoro.yml":       "mO+TDJD94jRo68GJaKTJzu8h4Q6TvC8l98UXHjJBBVE="
								"pomodoro.yml fixed": "Ps+2XeKhMrtTM1MkxohjKm66UO8l6UCnqPdTMIb/BLk="
							}
							multi_step: {
								hash:       "G237S6VSBLMI3I3JS6M31QHVQBVHJE8AOB1GKH7IDQ1SHIB6SSR0===="
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
