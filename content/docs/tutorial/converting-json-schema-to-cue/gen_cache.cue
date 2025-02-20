package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "JQAjp9k/SIHbXFzBuQi9qJK4OExtCAH8mEqeFkAZDkg="
								"schema.cue":         "v175kLSfHRXaJDXtgGl78/2ISpaMAhk/iJzlnP3cOkM="
								"split_pea.yml":      "SBpfGjWFaslI4S0k+rv/Zx15JqN+XJ0vIpAedKxyheo="
								"pomodoro.yml":       "hL0c7ZcevxNJAsOgctr7povEeQvdToHWgsxUD0FqaRw="
								"pomodoro.yml fixed": "0h4sIXv3JAdBE8CfuH8Rpshwd0KqNKOdZgFdq/hB53Y="
							}
							multi_step: {
								hash:       "TTL0CT4I34D1TSKJQK9TCEIJJFLQLR6USRA653BDSSIU9ERR3OCG===="
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
