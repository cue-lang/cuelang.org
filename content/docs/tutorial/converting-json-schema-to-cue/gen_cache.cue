package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "DQq0G+1rScTvEM2D8R80NDx01p6j/3NnPfWk3xsS1Sg="
								"schema.cue":         "OVImWKdrYzerr0Ax1KYFb5w/7s0ESD/8ZoEf1za+GUw="
								"split_pea.yml":      "QG0vLkrNJaNJd39ypeh8zEMlEMo0hKgEP2A1kTFXI0w="
								"pomodoro.yml":       "VHAapZdhYgfufp9dEPrmdTwTVNa/3IwaAi+9bPuIsNc="
								"pomodoro.yml fixed": "MAt9EvafuOY9kJBdmlCUHYAHPpj3wE8tvoJ07tZPdUg="
							}
							multi_step: {
								hash:       "ITIMTP659QSG0EF9E11LR7K8CS3A4A7VQLQDD9H3V21DFJ8R1LIG===="
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
