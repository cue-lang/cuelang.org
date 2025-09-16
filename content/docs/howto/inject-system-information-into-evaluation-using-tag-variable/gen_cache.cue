package site
{
	content: {
		docs: {
			howto: {
				"inject-system-information-into-evaluation-using-tag-variable": {
					page: {
						cache: {
							upload: {
								example: "F5nxyiEXT9dGlcIT/1Boy3zyR9DHiLacgaPvuYsl4wc="
							}
							multi_step: {
								hash:       "1SU2L7BQRF7NO5QPOKAB03KRNH9R0TFO8Q3STO5B1U2ICP480R6G===="
								scriptHash: "6PPT5UJN3U9APNN8NBEFAEO1S3PPKC3PB53DFF45QOQL1J9E0KUG===="
								steps: [{
									doc:      "# We use pipes on this page; make sure that `true|false|true` would fail:"
									cmd:      "set -o pipefail"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -T --out cue | sort"
									exitCode: 0
									output: """
											cpuArchitecture: "amd64"
											currentHostname: "a593004494f4"
											currentTimeA:    "2025-10-20T10:48:09.035726522Z"
											currentTimeB:    "2025-10-20T10:48:09.035726522Z"
											currentUsername: "root"
											directory:       "/home/runner"
											operatingSystem: "linux"
											randomnessA:     239830409128000571734721335677581048771
											randomnessB:     239830409128000571734721335677581048771

											"""
								}, {
									doc:      ""
									cmd:      "sleep 1.666"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue eval -T | grep -e ^currentTime -e ^random"
									exitCode: 0
									output: """
											randomnessA:     310567656024054240666687125437907175388
											randomnessB:     310567656024054240666687125437907175388
											currentTimeA:    "2025-10-20T10:48:10.722479912Z"
											currentTimeB:    "2025-10-20T10:48:10.722479912Z"

											"""
								}, {
									doc:      ""
									cmd:      "grep ^random tag-variables.cue"
									exitCode: 0
									output: """
											randomnessA:     int    @tag(f,var=rand,type=int)
											randomnessB:     int    @tag(g,var=rand,type=int)

											"""
								}, {
									doc:      ""
									cmd:      "cue eval -Tt f=123123123000 | grep ^random"
									exitCode: 0
									output: """
											randomnessA:     123123123000
											randomnessB:     19044607892918751542069396129612336348

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
