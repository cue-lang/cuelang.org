package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "oZwoSI3o10wCl+JEXaJWybaRcqNktKE7nWJebHLae7w="
								"schema.cue":         "mwZRycxVbxXIwrvCBUu6UkCbMsomztZPLmYRAvfe84E="
								"split_pea.yml":      "Q6qPLmqjogqbHmTba6h44ZsWLZs3SqKzXYdvWQI8T4M="
								"pomodoro.yml":       "n3IWr1UvQhk7n1x92jPETCb0qMhU+Kd8cAPOx2dyXtc="
								"pomodoro.yml fixed": "A0gIkV67X6un7QeumJ+/4iGo9kfyxrDF3TZANYxBKdo="
							}
							multi_step: {
								hash:       "8FDJC3S5JTJ6LL5L1BS38SSIQCU585N1VG5J5BQ4VNTP1NPIRMJG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.2
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
