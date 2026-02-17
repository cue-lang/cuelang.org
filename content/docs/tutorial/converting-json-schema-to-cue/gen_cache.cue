package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "5eQKlBWnrJpwayxxDT5tb+kOxoTGv8ostFZdGTrf8pU="
								"schema.cue":         "4hCrYzkrCEkp9BBtGS0n4NhEVcPemNq/TzLpO3QgNFE="
								"split_pea.yml":      "0qk770yC1DJkg31c4pZcVgljbVC8sEjVmJKtALI22/g="
								"pomodoro.yml":       "VzDD/6TgFE7Zs0WoifiIbVUDWYkVWsI4s+25ku15SK8="
								"pomodoro.yml fixed": "d5/u9ueojlyWO4LvQeiuq7jeU5eswVW2ScXy/zGuIJE="
							}
							multi_step: {
								hash:       "0KBRDNVHNFTDLMMHGNQVFACRR5MHG4252TL1PONAPLU9AT71CD3G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.4
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
