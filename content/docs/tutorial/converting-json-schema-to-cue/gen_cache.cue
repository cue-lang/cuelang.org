package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "lNA51rkXDCF3JPuh0a5tVdjsAmQGLgtlYzanz+GJrMQ="
								"schema.cue":         "hj8xtKTqk/gmxLqMPJDSBx5zBThhqaPRky6bKVJzxhg="
								"split_pea.yml":      "uMS7kUZdtYWcfqTuALEC2fMkVhlYBWfJ5RyJei8Hheo="
								"pomodoro.yml":       "mQcTleVraEGSYZ3w4HD2qTBWQP28XnrvhvAf5/LNzo4="
								"pomodoro.yml fixed": "ggKcyT5OsTtXTNbO2nbeJN9j2CBefFBD1kRb/plDN9g="
							}
							multi_step: {
								hash:       "CS5DMQS48ASGRIFSB5HV1DQVA3TJ67C8OSSJBRCIB00BGRA3HN2G===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-alpha.3.0.20241017110013-860906a7f025
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
