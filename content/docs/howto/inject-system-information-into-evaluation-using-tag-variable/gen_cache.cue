package site
{
	content: {
		docs: {
			howto: {
				"inject-system-information-into-evaluation-using-tag-variable": {
					page: {
						cache: {
							upload: {
								example: "qRXhYtDLIWtiU9jn8ZXyC6ywNb7tQoNcoDsixYJkI5o="
							}
							multi_step: {
								hash:       "QVP0RMRTEG5LG15NI8NKDB4V7QN2L25FQCOS4PM1LHGU08RF9TIG===="
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
											currentHostname: "5aaf74b2ccb0"
											currentTimeA:    "2024-07-22T15:42:09.335482408Z"
											currentTimeB:    "2024-07-22T15:42:09.335482408Z"
											currentUsername: "root"
											directory:       "/home/runner"
											operatingSystem: "linux"
											randomnessA:     211713655924324242055059561390647812964
											randomnessB:     211713655924324242055059561390647812964

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
											randomnessA:     143657368610527136390536098010246948926
											randomnessB:     143657368610527136390536098010246948926
											currentTimeA:    "2024-07-22T15:42:11.089104576Z"
											currentTimeB:    "2024-07-22T15:42:11.089104576Z"

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
											randomnessB:     233467104716791796342650775046032560001

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
