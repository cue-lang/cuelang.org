package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "buiazBJdVJq9XrXaVQT4feM98GWU53Jrwq5SgkguukY="
								"upload additional file": "xBYoX1/KeKEtUfxCJx24k3EXl5n8zNpq6sJcNBAnlC0="
								"a hidden file":          "AMDDHm2/Ac7fc2810gCyPEpEH2KlW7ZhUVq65AQeurk="
							}
							code: {
								"a code example": "5t3ui9R48PD23c47C0QiY87W/1n3ALqkinQw9uii/VU="
							}
							multi_step: {
								hash:       "5UNRSVTJLGFI11UF5NCQMNHJO9NROJ5OE5PNC07LG4QCC94T0IU0===="
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
