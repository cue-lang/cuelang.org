package site
{
	content: {
		docs: {
			howto: {
				"inject-system-information-into-evaluation-using-tag-variable": {
					page: {
						cache: {
							upload: {
								example: "kIe8GxhafCBLyp/3/DU2O11Ko9bzejUM1dybn3AW+vA="
							}
							code: {
								"reminder of field declaration": "UMfzZziYbB3R7oQNjw+Ai2I1IDBXOFIFBrn75PslFAw="
							}
							multi_step: {
								hash:       "GRLF1IRU9SV2LT8KUNLTBB1430D99R10RVEO4BQ9D6C6C9MPLNHG===="
								scriptHash: "DA7GAK9EBK294NB6852G82OPA6IRH5GTIAECFAM829UFIJVC3OC0===="
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
											cpuArchitecture:  "amd64"
											currentHostname:  "6dd780f2313a"
											currentTime:      "2024-06-26T14:20:31.375129895Z"
											currentTimeAgain: "2024-06-26T14:20:31.375129895Z"
											currentUsername:  "root"
											directory:        "/home/runner"
											operatingSystem:  "linux"
											randomness:       132484282436745506021675923464754311206
											randomnessAgain:  132484282436745506021675923464754311206

											"""
								}, {
									doc:      ""
									cmd:      "sleep 2"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue eval -T | grep -e ^currentTime -e ^random"
									exitCode: 0
									output: """
											currentTime:      "2024-06-26T14:20:33.440752618Z"
											randomness:       76925290309112046928227138631459974560
											currentTimeAgain: "2024-06-26T14:20:33.440752618Z"
											randomnessAgain:  76925290309112046928227138631459974560

											"""
								}, {
									doc:      ""
									cmd:      "cue eval -T -t g=101010101 | grep ^random"
									exitCode: 0
									output: """
											randomness:       101010101
											randomnessAgain:  196630286821974713862680135323676535459

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
