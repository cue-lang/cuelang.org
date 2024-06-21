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
								hash:       "1S5LM3UH77P5854DD72SOJOD6N6T0JS4DV19A1TMBG22TG051E10===="
								scriptHash: "Q48KO7VQHEOQ7MG2UCSGAB613PK42QJUS7V2BCTPIMNLM2QAO090===="
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
											currentHostname: "237076ef005e"
											currentTimeA:    "2024-07-22T11:55:53.548852596Z"
											currentTimeB:    "2024-07-22T11:55:53.548852596Z"
											currentUsername: "root"
											directory:       "/home/runner"
											operatingSystem: "linux"
											randomnessA:     305393324855059042016663249200523323477
											randomnessB:     305393324855059042016663249200523323477

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
											randomnessA:     147635992275163044132278626792114031821
											randomnessB:     147635992275163044132278626792114031821
											currentTimeA:    "2024-07-22T11:55:55.283804754Z"
											currentTimeB:    "2024-07-22T11:55:55.283804754Z"

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
									cmd:      "cue eval -Tt f=123456789 | grep ^random"
									exitCode: 0
									output: """
											randomnessA:     123456789
											randomnessB:     239656688586215015599156059076728094567

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
