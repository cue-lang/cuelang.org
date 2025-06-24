package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "GC1Pn4cnVYCm++mgyCnQIYZPUIILRsW/wMhtvRHRrFI="
								"schema.cue":         "YqPHzIuKfSuXcLaBQMM1DNdFvonnsnABnaoHeSHEQLc="
								"split_pea.yml":      "v/tIhz1c2BUzT9I+Vw9mxWvzq37jNHLJL5myzseVTcY="
								"pomodoro.yml":       "omBg3isvGG5h2Rwpk7re9tELD+F1lEpuo1AUkswKZc8="
								"pomodoro.yml fixed": "LXuxNsRZo7QM3dG1aGU/cbFZafHgGV//PySQlfVwsXo="
							}
							multi_step: {
								hash:       "6J46U496MDTBFHOD1H46727DG1UOPFPK2SAL79ERGUPMT26B6STG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.2
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
