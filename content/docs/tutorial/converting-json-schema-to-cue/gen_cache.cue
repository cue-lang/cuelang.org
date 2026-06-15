package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "bETTfSnYhtbBjRqKS1tqiLFEassJYY8WGublCyKj8w4="
								"schema.cue":         "HxBeL4d7mgL+lehWr85J3TDIxyhGUGkASQ3Abi80fVc="
								"split_pea.yml":      "j78mN8B19Lzd2rvTOw8e4QJ8Y05vfWlM7QLvWcgOJrc="
								"pomodoro.yml":       "iF4wnL7PhGoVfFkSaOvUMnSAzez8PUb72GshpjbNL6Y="
								"pomodoro.yml fixed": "OUxdERYdbogmC2Z0N03cKX6NUJPuUdtUuSqptzRPJvA="
							}
							multi_step: {
								hash:       "E1KBI1U0IRT0185NQ3TJA93VVP3134QPMUUCESDA2GDVJ5T0HJ7G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.1
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
