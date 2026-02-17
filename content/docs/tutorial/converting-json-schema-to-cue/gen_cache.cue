package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "QF0to/WrZHEvoUw+vyn6IPLytRkT5u4YL7KJ3YuKuFg="
								"schema.cue":         "RLIwK2tfoRCJPpeNGlbxtw66AOMYrC9TtiMdCwBPT0c="
								"split_pea.yml":      "erUx07qP96arEJ8uyLcpqwBrlMKhYX19T3zmtsY0Iik="
								"pomodoro.yml":       "VMwPNAJhGPsV/omZ1uHvzcoTPjhzKp8FhNk89KKs8hQ="
								"pomodoro.yml fixed": "aWbCtoT96eICEHWVf1FjgL0OHW/BdiUguEnFzS2D/eI="
							}
							multi_step: {
								hash:       "UO5FFTEK56I81JLK4UDLF4BAJT377RVTG60TRF2HRGM8GRDUBNAG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.4
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
