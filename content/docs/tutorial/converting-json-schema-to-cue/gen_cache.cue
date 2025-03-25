package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "5JrK+dwsveznrO374DCo7Irp6Lmu6DgMeVIacCkBcEo="
								"schema.cue":         "ZsfA5d1iwoURede7SapXNQ1nYxHUPaXi09IcqvVsSZ8="
								"split_pea.yml":      "yNB1PpJ9VD16LpSZnUwhRKBjCy5JkrmbukA8Ux4SCzc="
								"pomodoro.yml":       "LQ1BwHKtnbFFRVNsFBjnW2o3OxGIbS3jj9oT2eKY0g8="
								"pomodoro.yml fixed": "UFClHExA4cd7//8Ps5/VUdI/PHoUq7K7ChMXtFLgC1c="
							}
							multi_step: {
								hash:       "33DI06L0FMTBFEH477K131FBSR1KPFPF9MSQ92QM32KJ36PAO4RG===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
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
