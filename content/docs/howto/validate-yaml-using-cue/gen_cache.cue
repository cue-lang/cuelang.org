package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "V9hedaR29DU25i5eVxc5nAzXjDJtGVD8/gW72gaLcS4="
								"initial x.cue":  "PtH9QhZUL8u35tJE/PcwP/vfzNCuDwrt/0tr6hXPePg="
								"another person": "JcTFIg/ky2JP92ln/JCM71PLNwt2N6liREmNLqnQo/o="
								"fixed yaml":     "AxVbzyRbucgkxSIPAkSa7HKd3TaZ0YQPUcccN/QTXeM="
							}
							multi_step: {
								"AMSJC637KBQP4L3CT26RO9RJCNPO45N3BLPBHJ7L0040CU2K79BG====": [{
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
