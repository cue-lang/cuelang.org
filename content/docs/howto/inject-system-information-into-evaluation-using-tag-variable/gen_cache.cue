package site
{
	content: {
		docs: {
			howto: {
				"inject-system-information-into-evaluation-using-tag-variable": {
					page: {
						cache: {
							upload: {
								example: "L89+E25XKqT0julaYMbSlFL+BCRKxtviyr1+ALYFtRI="
							}
							multi_step: {
								hash:       "FA9J4KO4P8IIM85R6SNIF8OEFR6MT6CPUU2FO4EB39STI06749LG===="
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
											currentHostname: "7a3a38273ea4"
											currentTimeA:    "2024-09-20T16:36:14.481759557Z"
											currentTimeB:    "2024-09-20T16:36:14.481759557Z"
											currentUsername: "root"
											directory:       "/home/runner"
											operatingSystem: "linux"
											randomnessA:     303485362439881500771283549311960488816
											randomnessB:     303485362439881500771283549311960488816

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
											randomnessA:     203983921450966532178792620278273406567
											randomnessB:     203983921450966532178792620278273406567
											currentTimeA:    "2024-09-20T16:36:16.175964221Z"
											currentTimeB:    "2024-09-20T16:36:16.175964221Z"

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
											randomnessB:     52993096906768831100440191860360588041

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
