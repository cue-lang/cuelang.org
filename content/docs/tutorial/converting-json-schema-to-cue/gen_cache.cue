package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "F7KQE+w4pubkOLrEKyA2qIm2RtrUXj5mqfzEFg6wM4Y="
								"schema.cue":         "MFgTKVyRHx+vzQANPZhJM3lbMeacbWTjACJnyVxarEI="
								"split_pea.yml":      "SeNNiUc/IE2/yWz83nL6ai3Xl9NGnrKhMGNMk1IyNPQ="
								"pomodoro.yml":       "6GmXk1TuKrdweki9C/U5waUcvYMR3RJx5C7Vcoefui4="
								"pomodoro.yml fixed": "buCun6df4xe/ok5Fw2NTAFOf0I+7G/mOwJrwHwrLPxI="
							}
							multi_step: {
								hash:       "N2NSA9CDOR376LF23LGJ5ID4KH0489OBVOCI8EF3GK9BNUL6G560===="
								scriptHash: "F13IT2J3MN36GG3N09O9518426I38RFFPOPK0L8BIOG0OSCEHI0G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0
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
											    ./schema.cue:12:17
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
