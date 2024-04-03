package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-json-schema": {
					page: {
						cache: {
							upload: {
								"json schema":     "awQYxQbBHDgf9jc9L+sedmBNBQEutNHX4rCa1kq7Mc4="
								"schema.cue":      "11QVDoSQ1h5NgUVUCwyPVD4XlgxNQrj4IwbEtolqkj4="
								"data.yml":        "91ohhzxUTQOnOiNnow5iiyKng2MvIpF4WjBQkMvGAwQ="
								"constraints.cue": "9Z//oqMOIM6ixqmsTyYj2qNAnd5g48aNaBRNg9WsEg4="
								"data.yml fixed":  "8gMKOOpLmeW7afqjC7UwNp9OmWl+BykJ0EYEQdxDryQ="
							}
							multi_step: {
								"M39FICLQGELBTJTAM0AO372DHDDBTVOP5GQR4TDLCAS2JRCQB1U0====": [{
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
									cmd:      "cue vet . data.yml"
									exitCode: 1
									output: """
											restaurants."Il Pomodoro Marcio".tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:9:16
											    ./data.yml:11:16

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . data.yml"
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
