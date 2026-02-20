package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "NhI8KabMkyZLTFavSPIIYpuHeYwhWqXNqYzYpUOOjdo="
								"schema.cue":         "LoH+YICWPCG7jEKhAleknFFT3iMcNDVsavXNfW3ssSc="
								"split_pea.yml":      "mNGM905UHPL7H3YW4CEmMkd5joO3neT7gIydVjQ4ts8="
								"pomodoro.yml":       "tLgsOyXZz+2XlnPkciNWjUJIqfEXSIw4AFJNJy26Q08="
								"pomodoro.yml fixed": "j/xxI9Tqatw3MsrmHIwR5S/X9omvC4t5XMm9ZqSZAJ4="
							}
							multi_step: {
								hash:       "9NKA7GLVCD99U4JGFVDCCNTDJPE5LLL93AFVD8CH201OSQOVEFOG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.0-alpha.2.0.20260220153551-3dfa50a46189
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
