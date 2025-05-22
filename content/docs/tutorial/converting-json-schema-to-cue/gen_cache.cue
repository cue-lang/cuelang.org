package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "53t3rAw5795mnKDp9U33ryHCZ1OTQgiY06eCeQvoqx8="
								"schema.cue":         "165hYyAx3KYBCRNuoGrgJlJrlom7vWrlSW2svoHwijU="
								"split_pea.yml":      "OwTUok0NvCcaKah9qqbWScRHC9Mp5Aa3mDagLGkRLso="
								"pomodoro.yml":       "+c1UjSF4frP3waTRH4+sqFWPgAAD0JJomVWKR0HY5Hc="
								"pomodoro.yml fixed": "CYeDAipNV+CArLyAsOfYiwS26+ahx1sclBxxo2GXlFQ="
							}
							multi_step: {
								hash:       "F596D98SJMUIC527JQ7QUTCQ2SB0ME7VG514MEKUAJPQF73I3B6G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0
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
