package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "MSGmkHuRrjUA4oHaL6BVK13E+LFCEX3xlVh7towmgvE="
								"schema.cue":         "MRGJr4MQXPT496L/YHVDOYHlANMZnX8W10aL5by5oW4="
								"split_pea.yml":      "Oa9geRu4Ebg7KcxTT3qOf/0fEXkJJSDDUWq12foXSss="
								"pomodoro.yml":       "EhAdUw40/I6ewohMV3hggaLNqEpoxT9+/qimFDkWT1s="
								"pomodoro.yml fixed": "nJjlDGzjSj57Qka/o56wsk515KPXkoRV1xCbCxtH/io="
							}
							multi_step: {
								hash:       "3BCQU4I3GM8U5EVPGL5K83J40ME3GEM27OEGNQTN278UFC99TJNG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.3
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
