package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "r10ucOZ8alqVXqTahGakZaXcSkHyMyo0f3Q5hDg5szE="
								"schema.cue":         "uQH7QczmwggYhr0ZkNKgT0qcVKlEg4/cAojKkGlQRYQ="
								"split_pea.yml":      "vcU8d5iLv7qa9DNK8btYh72Vmjw1ZIyo3FPbtFVtz88="
								"pomodoro.yml":       "5hNYptWjFWlgTx/OP9GZHacoSyYIZceBhkTwV5+fv7M="
								"pomodoro.yml fixed": "99o+E11QkoGb7+9JLac27d/zdLBJTMOQFJqR4p3ezWE="
							}
							multi_step: {
								hash:       "V88ARNHT131SDJSQKAQUT87UFIPU3LOVC8L59370VUB40455VQT0===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
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
											    ./schema.cue:13:17
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
