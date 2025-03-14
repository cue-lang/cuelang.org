package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "PGXyfpwIZdWimPyqeqNcJf3fLLKdm95QlVe8eATygZg="
								"schema.cue":         "y+CF2Vkiet0erxxM9PpMu5cbXFWEq/wJYF4PjmPK4dE="
								"split_pea.yml":      "Ie4C1wnZwA5b3mZLKIfflw1pikdfD5geqlhY7HI+Stc="
								"pomodoro.yml":       "5qThjDr5zII7i+adN3Z34f7xghCVv0ZYyBn4afUcOl0="
								"pomodoro.yml fixed": "QUEdzo7OkRvcj/pUz/rDjFdJXBP2a0GeKrSeFWRpi9M="
							}
							multi_step: {
								hash:       "2D8VB7HTKTUDKEUCO5LK5UI7RA3KDRJ1LKTJ3FRN6MPEVG2AFF50===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-alpha.1.0.20250314174817-9e333c606194
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
