package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "5zIZGMMCCdO18r/MZxYVm8tStDdARScJTMhr78dGBNw="
								"schema.cue":         "9rGp7Q/M91D7xyF9KpK0hZbi2UIsE1HoBrrQd4P39cE="
								"split_pea.yml":      "Off/mDevxSMcdGQP23lAmPwxBGvatBpi7uiSjlMOKsU="
								"pomodoro.yml":       "YCGotZLNhhSSw4qD9v4YAGrHJx1lRISQLAx+Abbuslo="
								"pomodoro.yml fixed": "JwPK6Trme8JY4zWxkMhGEUMc9g5FiWIR2gRzMwrk4j8="
							}
							multi_step: {
								hash:       "9PQAGOSIAQSBJEM0RLK9DBE9BIIN3TJVPJ2J00EOIKCRTLPQRS5G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.17.0
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
