package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "YgrJ9RutFSJCOXDgGlsKq4/Avt20DayMc94Z7rumxyg="
								"schema.cue":         "dY2f9P3xDZj0/NB5QLU1izGF99JD1jSAGfUEcYTIN2A="
								"split_pea.yml":      "a0HmThWPz0EbeCqSf6W/CxQMKrlvu1pcdnCcsug3ev8="
								"pomodoro.yml":       "cjzxYPhHPcjlwI9TpaIPlGemqbcegwGfyCTPssfVIWM="
								"pomodoro.yml fixed": "WC9ycIPI4HIOLJmzotm9NctZtjbJcjql/amg8jtJ2Zs="
							}
							multi_step: {
								hash:       "5L7PV0NDL40F7B86U40A558JUGIIP4GBPAPMP40FSA7G2N6LABE0===="
								scriptHash: "C4LR0D5POADT8TNNESICONGVCB5E89FSU7UHCQ06E31VTC5S7HF0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.2
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
