package site
{
	content: {
		docs: {
			howto: {
				"inject-system-information-into-evaluation-using-tag-variable": {
					page: {
						cache: {
							upload: {
								example: "GNhPlOVgVnnjWqzicnTC2dnxmcfWceGbxc4vxxqDGNM="
							}
							multi_step: {
								hash:       "0Q6RC0CD3LBGE7FI5UTN47A66SS2VFO601PFU2VTD5G1QGBAN390===="
								scriptHash: "GR1KG37401FTNS03J13AVJIEBPPFVFI946AE0NCCRV5B2BE31KRG===="
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
											currentHostname: "b62a4f2c5418"
											currentTimeA:    "2024-06-26T14:47:52.444657933Z"
											currentTimeB:    "2024-06-26T14:47:52.444657933Z"
											currentUsername: "root"
											directory:       "/home/runner"
											operatingSystem: "linux"
											randomnessA:     76869263664924818696353024877640747824
											randomnessB:     76869263664924818696353024877640747824

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
											randomnessA:     334345854851775733873075943755346586704
											randomnessB:     334345854851775733873075943755346586704
											currentTimeA:    "2024-06-26T14:47:54.214945086Z"
											currentTimeB:    "2024-06-26T14:47:54.214945086Z"

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
									cmd:      "cue eval -Tt f=101010101 | grep ^random"
									exitCode: 0
									output: """
											randomnessA:     101010101
											randomnessB:     328777344665569547685134346298941831864

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
