package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "sYc2vjJadEr8fMco2AdlU9/cX3k55Vz5IRCboq4FblE="
								"x.cue":        "aSiSwzymjRcp9TsKzQybUbYryiw7KsV6lPqV/z7l6QU="
								"x.json v2":    "eMoVUKtaI+wGH8I92e8uVhGydaAsXj3MJj1ZEIBiYw8="
								"fixed x.json": "l4HdELGGEUYTBrfL3m14PmnSjA248v6KQ/DYXQTw/v8="
							}
							multi_step: {
								hash:       "E2GTJFO7QT4A53O3DCOKQPNH6G521GGD8TENRT5SC08BSOVOPC40===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
