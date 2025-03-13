package site
{
	content: {
		docs: {
			howto: {
				"inject-system-information-into-evaluation-using-tag-variable": {
					page: {
						cache: {
							upload: {
								example: "v1zyZbR/erjThjSNATAVO/qwYUY8S2XR5/K3Tr3B8pM="
							}
							multi_step: {
								hash:       "GGBH3ETPVPP6KFJOM8K6DDR0485BKHBTBDGJLCS1BAEL1HQBKUO0===="
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
											cpuArchitecture: "arm64"
											currentHostname: "7c8be7f9b8ee"
											currentTimeA:    "2024-11-21T12:24:01.928819957Z"
											currentTimeB:    "2024-11-21T12:24:01.928819957Z"
											currentUsername: "root"
											directory:       "/home/runner"
											operatingSystem: "linux"
											randomnessA:     48143939811130088532707076255718137665
											randomnessB:     48143939811130088532707076255718137665

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
											randomnessA:     256474124597080097645628343043781257633
											randomnessB:     256474124597080097645628343043781257633
											currentTimeA:    "2024-11-21T12:24:03.630382379Z"
											currentTimeB:    "2024-11-21T12:24:03.630382379Z"

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
											randomnessB:     154463835233876152095912350456117094604

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
