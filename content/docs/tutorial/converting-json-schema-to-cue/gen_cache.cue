package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "G+7WogA7iR+5VY4g7DSAZys6/ou7Cji/gmjlV4CPukM="
								"schema.cue":         "x47pZekSWKW7sEJBx2wHJgDYJgAtk/YnjaUVs1UOpqs="
								"split_pea.yml":      "yFoDiUTRz9oi3d1l9a6dxDxI3q81hPTa2aSaGzWya5g="
								"pomodoro.yml":       "LH9LMvit3jS7UxOxwzkCoJlfRbsrT2rHgOp8Oltd60I="
								"pomodoro.yml fixed": "vxbPe4MTY10G9iDXBWLj3BmFYNct9h+IQtjuSZfCASQ="
							}
							multi_step: {
								"MOESQVAC4PPN15TV7SVEUIKJS72SUE3I83RPFQVEICBV27MNUS10====": [{
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
