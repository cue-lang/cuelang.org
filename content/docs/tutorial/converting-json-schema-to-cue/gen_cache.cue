package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "1DJQJfKYE1kMDYb7GNiqpO8gNVLatYMQ4jhgqzpiCTs="
								"schema.cue":         "NAn9QBd2EKdkwTQ0mJsximB+cdiIOcXH9039k1Bzx3Y="
								"split_pea.yml":      "zOzXs83DkYmt9NSkZBOVyGS2IKr4mZKopVvIu0RyCXs="
								"pomodoro.yml":       "QXJzN1d+1h4Qx0MWmlXN+AmqbcNx3r9P42NX+C03Axk="
								"pomodoro.yml fixed": "Ga0rG0XhyjU07PYKygxA9H4yrMQt7+mKeFZHc+D9HSk="
							}
							multi_step: {
								hash:       "4HV601EC2KF014TRP7VS7NUAAI78I76AT1VC1GI6NMR3IPGA5ER0===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
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
											    ./schema.cue:10:17
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
