package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Q00TO0dak361WvwLm7WPO7P4qDBWn6XbMHlMS9i9TVg="
								"schema.cue":         "sH3jqzWLrhiX1gST4iJkIUPXeCfoOGk5PJdr7YMfwuY="
								"split_pea.yml":      "/K0OhXttl99o+dtFzUo+Uv16MLKwQnLyQaLV/3huotA="
								"pomodoro.yml":       "7QeABwztb58rrFnn118cvYZC1+5xU5vv64bcoxOeq80="
								"pomodoro.yml fixed": "xdxUyg28J9E3/oMOFFHhNH80ds3zvCOmJ3zbeT4b+yY="
							}
							multi_step: {
								hash:       "F34SLLNC8HSI2AQ2P2QRNTM5I1Q9V203VMHIQ1F2FKG1T04BI48G===="
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
