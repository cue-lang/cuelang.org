package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "NYxdEzWuA81ZcMD6+YuC3raXjOuyKxDP2ZFQYkXWs+s="
								"initial x.cue":  "KLKN7ipmAn8yExvgAM+ChwY/m8KfU9Hn49K0M+3KJaU="
								"another person": "FoqTsq0VXfKbL9c4wfE3a/8C50iS9WwH6phBGYKHUS0="
								"fixed yaml":     "ae2KfqV0OF8MQybDfhDb1abv5mbIJUgDLMMESY2kHo4="
							}
							multi_step: {
								hash:       "BLK6EJ8P24P4ATU9GK08VMROS9QU6RP2L4VHSEHE8EGPUHPAGI70===="
								scriptHash: "DE9VH3D0G7UR7VTKS164SH6455EO8BDDJ06SC0TH6SBBKB4RMM60===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
