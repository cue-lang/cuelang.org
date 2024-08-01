package site
{
	content: {
		docs: {
			howto: {
				"inject-system-information-into-evaluation-using-tag-variable": {
					page: {
						cache: {
							upload: {
								example: "QbFZC5qfCIk3ZJcK9o782A0b1es94qbnHadoeyzatZE="
							}
							multi_step: {
								hash:       "67KQL4QBBBUN6BS5NGJDTEAMV8DMPS07IA44SR2Q9TAIMQTRRTT0===="
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
											currentHostname: "fd46025f571f"
											currentTimeA:    "2024-07-24T12:16:36.998462958Z"
											currentTimeB:    "2024-07-24T12:16:36.998462958Z"
											currentUsername: "root"
											directory:       "/home/runner"
											operatingSystem: "linux"
											randomnessA:     191422226613386244533905883473376449771
											randomnessB:     191422226613386244533905883473376449771

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
											randomnessA:     311890454198696002262433839322444861509
											randomnessB:     311890454198696002262433839322444861509
											currentTimeA:    "2024-07-24T12:16:38.716151613Z"
											currentTimeB:    "2024-07-24T12:16:38.716151613Z"

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
											randomnessB:     297085020426887323714942717980521585483

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
