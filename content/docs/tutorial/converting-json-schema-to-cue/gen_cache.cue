package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "wZZk/M3ZbdU3ypZtK/9VYdoHVdpuIabfwpQQLQejnJE="
								"schema.cue":         "Bc/aMa3pXXeOs0RRTOs7b0/ds8hkkbC54pbXA0i2kZw="
								"split_pea.yml":      "43xhc+7qiJcSh6NvP78x1FfMc30zimXBUau57/5uAvM="
								"pomodoro.yml":       "KNIc/ioom/4UEhaSgS6aA/MDSSmp7qO3WN7ncTyME3Y="
								"pomodoro.yml fixed": "tlPmkYVUvJZpVDKCT8yJMD564y+Me5D97V8Bm/A2kl8="
							}
							multi_step: {
								hash:       "RFRE7NMU8PV06M9AHUHND3Q6P8MISA5UDGI2KPAE8QLJ3MAMH860===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.1
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
