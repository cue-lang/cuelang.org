package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "0AzCh+o/9Z95y6UKfP0uIzlhL2d/fwpK+pUA2X6/chE="
								"schema.cue":         "Wf64wOWMJcXpY0getRTlji0mDH+1/51KSc+ZvNKSn2w="
								"split_pea.yml":      "BDy4rG/SQLaGTCaU9YqN5LvGLiCkp+2FtULIz9H+o4U="
								"pomodoro.yml":       "6Gellug655anlwizqWyVDadtZGYB5fRISOs0Gxp9eEM="
								"pomodoro.yml fixed": "2tzbkgBrvXN00160CWBDK+kMvcEQ5AJsGY7YjLa/uuc="
							}
							multi_step: {
								hash:       "S5UHG2SVEU0I65RF4S5QHUF7LSQBS2BSHGG9JDENHM9RD8VQ04BG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0-alpha.2.0.20250718122344-9afca7305a43
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
