package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Msu1+AuACBU5vdd3r0EjhPvw5eE4a00uv9b8KOWU36Q="
								"schema.cue":         "g/vJXctNVIZewEzTPXNCihUErE7ubrRLsuBaJTndj+k="
								"split_pea.yml":      "U9RHzXxAZLvC7TCErxs2z3yIhOFM86yB2vt5IRwhcqk="
								"pomodoro.yml":       "lW/fUiaCoTMmLfaZjvB+sZaGQ1TMy50vlgLnVUM/isE="
								"pomodoro.yml fixed": "cA2y4+VtdkkzaG+sBe6i26p3d1yEbSEexWA03Uth+h8="
							}
							multi_step: {
								hash:       "JT8E0FFNPAUR5JHIFHC5A3PM3QAJUFQ67HCBUU37CC2JJ8V89GS0===="
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
