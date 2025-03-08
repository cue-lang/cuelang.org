package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "29L/+WgYXow3SKa/Euk1JOXykOVK8wM0gJMDBJdwEJA="
								"schema.cue":         "6OFjalmOFwyslsVScYFFEB1bHkLOkj8TeBEejb01Bhg="
								"split_pea.yml":      "RvQrm4dhZXkfCWf6X9kRFEC+l/DBfrRtDxhTIDRENCc="
								"pomodoro.yml":       "YoIVsGHoXN/nREBTLfxlTchLqttCiPCtFAJMRZfQnLU="
								"pomodoro.yml fixed": "/zChZhkgssKzwkhSDH8WGQOwu5r9lIaxu857S36lJZw="
							}
							multi_step: {
								hash:       "LVHA6LBU60RJUBL8ETIT8FN5PSU3QNK9RO5B70LDK8R4RH0EPKQ0===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-0.dev.0.20250306134408-5d2da079a295
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
