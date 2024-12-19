package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "uaegfPJ2UgCXZh5tSzhNJ3M/AXhq2/blT2hHjSzsBao="
								"schema.cue":         "2hELWww9hmBiVu6G+VAXgaeFnmFDfsT27axp4jP1V6w="
								"split_pea.yml":      "oT4Ce4w4b+ihBiveYx+7rTyPqJK8D2NPkQE0SkoZ5+g="
								"pomodoro.yml":       "rPdJ1GsMpBLSEwhKF5AEKJ7P8d3WcMM8xzrdYhH3Kfg="
								"pomodoro.yml fixed": "TwyfySrw9j6hPUEJTuPlcUgxS6GbfQR46/fJOeM4gek="
							}
							multi_step: {
								hash:       "T127KADS4HA0U7H381S7I9SAMQEBCLUJOQFG17K4GM5ON4UVDA4G===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-alpha.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
