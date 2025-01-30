package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "vOH0U8PwjXDZy6Fo/nPdtND9Qi39Zrcz34rdd9YUaN0="
								"schema.cue":         "1yutTi9BFfiyq1aiiRij3KUP+9QP6WVDCfo1rQNXXnE="
								"split_pea.yml":      "300NWnR1hSMDAMGn5ygjmVJcZhGbp4UZAqSX6P+Z2Sw="
								"pomodoro.yml":       "v8cSnE8PXtEu04qPT7Lzt7C6da7IGgarBAr/NZbhKbU="
								"pomodoro.yml fixed": "OG6iZR2/G4gUewlNGnhz6KQ/BL8HjhfjeN9tpFTQWiM="
							}
							multi_step: {
								hash:       "GT5FBIGSR29U9SRRRHBUR7QKGN9KAOAALSE3LELJLSMIIM95KJ20===="
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
