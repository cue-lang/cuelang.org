package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "xW0rWN/YxzJoVXVf/HuJLo5cHUKXV5EJhoRV853EoNo="
								"schema.cue":         "oDOoSx04Y8OsS9w2jmt1OYOcFU9Cxl2bYSFYHMUttQo="
								"split_pea.yml":      "xQ/RONI6aWNp1/PXHH7inrQIjDuN0GrwBj5z1rAPe20="
								"pomodoro.yml":       "NZawDpeLPlrzTf6b0qMvlp35ZXzg5UdMhX+/4CL4bJ4="
								"pomodoro.yml fixed": "JbccY7SxpBbL8LlxpLUkYiiHyCGBpGEFD0IqBxeYMV4="
							}
							multi_step: {
								hash:       "IOR9P5DJJA6NI8ADS5OKTQAJA32ENIUOQJBLQ24P91TKQ34R872G===="
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
