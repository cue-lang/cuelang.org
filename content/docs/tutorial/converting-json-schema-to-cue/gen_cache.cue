package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "0NCMWe61A+PaIfM7ZJXTpwYBgi9hfZ0jRK+tKCtUSMY="
								"schema.cue":         "rqcbP13nv5r0+y9z+FtsnU2WY+mnK5zIkSD0a6as9wg="
								"split_pea.yml":      "3KYweb9eZkYSHveiaXFxyrZSuCSxCBW5Trpqk+6k9VE="
								"pomodoro.yml":       "hL4etOTJv5ksedh9UQZbtoGgrSxLt5E+PUMiNRvc4jg="
								"pomodoro.yml fixed": "6DaG4kZNzC7nun9j0DD0IxlDkZpJ9V0ukuU/agkiGe0="
							}
							multi_step: {
								hash:       "698MMTQS6KGNDNT225CVIIJ3P75BIGSA1A536B3EEQ483A50747G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0
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
