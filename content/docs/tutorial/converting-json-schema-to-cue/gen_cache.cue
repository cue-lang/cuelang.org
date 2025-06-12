package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ce5WUxgJWI9IDo0tuIk5QDFHxA6FRDRvK98lAMfztfY="
								"schema.cue":         "A4MJPRGO8z+WAuu0nFpIx5oKBmlkKMFHmfC0rZ/OsSA="
								"split_pea.yml":      "n12iOuVICggZrgLHxkmWQ291AILlaKwZkJUO3HUPk3w="
								"pomodoro.yml":       "iaeRLYgLNFlNZYNyzl5SqHbAzZus/Zqv2jVKLa5tmvw="
								"pomodoro.yml fixed": "PBW+FgVslpZYDng9vAriIsh0hV9y0QhUxkT6NOGfsFM="
							}
							multi_step: {
								hash:       "1KOP5J6A1M90F5A1LGMBA83OON869303PC6O3DHDGH77SVQ35RS0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0-0.dev.0.20250612173542-c92590272bc2
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
