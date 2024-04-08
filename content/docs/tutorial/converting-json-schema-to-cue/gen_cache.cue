package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "xAp76LlMagQiPoC8/rjyu3I5OGO3s8mf/U6Xqo95QDA="
								"schema.cue":         "5caESpikBaYT6nLWTxDhjzeyL2p39rCZal0OMhv27T8="
								"split_pea.yml":      "Gd634zxi/LNrJVfGEdLWRDilCz3sLPOKibNzGUBleKE="
								"pomodoro.yml":       "aKAqDcBYr4NMU393bRWU9QNBrpwf1rZULccsAbpO2sU="
								"pomodoro.yml fixed": "srilbLn1KD0HkEOTZ98GvDz26XD8xQvzRZGf9P96zCk="
							}
							multi_step: {
								hash:       "4MM5QVQ7718FNHAM52PC2LKLHFV73ARUB91K4DLBCS7HIE5TBITG===="
								scriptHash: "SHPTQ81E95CP9JF83F3444BQ9IR0272SFCR8SS5QR85P2VR8OGV0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.8.0
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
											    ./schema.cue:10:16
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
