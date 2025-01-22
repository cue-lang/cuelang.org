package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "9+VrvUVThS4r25IdjCeUUNBBi9CxqAW6ntZjiW/Plt4="
								"schema.cue":         "BjkxzvM39ox6iKV7Vmh5xgoNowfTMsrmkmtGGD7h270="
								"split_pea.yml":      "TA9Fr8U1PEUFY3clixthBjk6mNpbYIYY14qGFntrs6o="
								"pomodoro.yml":       "SL63Lt6f3YJohdEoDTswdKJNsYj9myFVjrLXkB3vb/U="
								"pomodoro.yml fixed": "0J6MC3IuzbGfWyDPnixDtrko0hfpoEeqPIdKYIkcxUg="
							}
							multi_step: {
								hash:       "C8POIESPTFBS7KJV1UHIANOTMRCNK6F92U9TQRC5V5SD3BCC2I60===="
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
