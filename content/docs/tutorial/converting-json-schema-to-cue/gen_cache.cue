package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "uvrn/YoD/1+GgX0T+kL+WJFpAByy03DP+XDiilvAFR8="
								"schema.cue":         "WQYu29u6M1A07sALyrqS+u1mAx0a7iW/ATCKfSY+uZo="
								"split_pea.yml":      "Pkhej8iGDDxTT1Yj3G0e4vCSCz8UoKf/lFe3ekI5sVw="
								"pomodoro.yml":       "B/AauqZ3lTWEjidkfsklOVm9JM0PyOav+OqX98eoB2Q="
								"pomodoro.yml fixed": "G96DtIewrQwUUD200izgKTSNMttPyEc9Pzm77LindO8="
							}
							multi_step: {
								hash:       "8JN570EE43CV1JQIHEQD7GVP8A8NHI76EVG0JPG5R5F1B3EBECDG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0
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
