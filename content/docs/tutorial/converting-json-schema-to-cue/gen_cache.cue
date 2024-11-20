package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "HIArS0ays3Wmky5FABQdM333ep6BqSvpRr+dQbQRtEg="
								"schema.cue":         "zJeYae47J07xANDT7en5PHzQYFOHLGrmXlC0DCs6+8U="
								"split_pea.yml":      "EIZ13abkp0zwosAVUFHe46QaOoekwLQKQ7a2Kty0ViI="
								"pomodoro.yml":       "1dphwl6lLMvtGHSrmPOTgbvVwN5VELSV6kg/0lmD0Mw="
								"pomodoro.yml fixed": "KrRWWA2dADI3D4RWDyepvaJiGGdRKvq4s32mClKxBME="
							}
							multi_step: {
								hash:       "288RJIHP1QM96C1HMPMJVQVOC1ARLRMUB34U43VTOOIEC00NG02G===="
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
