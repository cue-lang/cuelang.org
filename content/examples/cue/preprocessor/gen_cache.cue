package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "OOOMk1pg+1fbju4x0leNF28yRosHrY4SgO2vjwXZ4ME="
								"upload additional file": "hPNINRYMnoqqgBz7XOWztk+2+Qx9AkB6ZFUjPAW1MuI="
								"a hidden file":          "LeKa5hczJDHlbzFysr1boC5QP2BLLeQCoBNhZk2/F/M="
							}
							code: {
								"a code example": "KI0375Qy3AIggoi7Hzdkx5Or/KfiVqF5OjgRSOALwtM="
							}
							multi_step: {
								hash:       "MFAK1J3E7UOUKIFJB1LREN5H4E6334EQ4KVBF0J4CT4FNV9Q0PMG===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											x: 1
											y: 2

											"""
								}, {
									doc:      ""
									cmd:      "cue eval >result.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat *.txt"
									exitCode: 0
									output: """
											x: 1
											y: 2
											z: 3

											"""
								}, {
									doc:      ""
									cmd:      "grep bar foo.txt"
									exitCode: 0
									output: """
											bar

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
