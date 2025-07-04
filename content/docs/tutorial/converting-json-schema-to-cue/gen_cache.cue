package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "i+rHl6cTgwSjqpjqGSeR722QLRpZvrLkl2mfpa2XwwI="
								"schema.cue":         "6o5Rv/eIDafEywFlyj1aI1KAbxg3wR6QPXXoNM49eNE="
								"split_pea.yml":      "LrYsN6IPKKhGKjLx1lsGaHK2eOPqVr2TUcWSz4ruiEM="
								"pomodoro.yml":       "XORIN/1qtjwJTp/+VlWldjamHpwjg6DJDmpnmDwKCDU="
								"pomodoro.yml fixed": "o3O0YGnh82hZKDIWHruYkFaMPrrFjpwkScQws50j28E="
							}
							multi_step: {
								hash:       "GFFCEEJ7KM5OMJ1VTA13CSDJK4GF39HKOS9J6LNL6LSNA6H8L4H0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0-alpha.1.0.20250704171720-206e82485fae
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
