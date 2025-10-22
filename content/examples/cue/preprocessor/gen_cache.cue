package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "iqVlqnvB8+5jUlQscKC03d7QKCyUBsudnV+Mh63Xomo="
								"upload additional file": "V9BwakmaVJtaTYYyWZRMYRVPyu6etNLH/wAfs2JLYR8="
								"a hidden file":          "ZMeB8bZA7pOwUASNFjvgztoZZ8K0IAigWEMbbfdfAug="
							}
							code: {
								"a code example": "qRQJxPTn+vAJLlqXNGJvosWK+v8ockyU2EkHjVoyt1A="
							}
							multi_step: {
								hash:       "D3DMGPEN4V48G2C9C13IVEHQ8J9KUO4NBVHLFGVAIJVGNJ7EDPB0===="
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
