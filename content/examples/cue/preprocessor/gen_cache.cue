package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "HsmOj8hiKNvkZecvDKDASR8ue3mH5dN9uhsNJ/z+Tiw="
								"upload additional file": "vlLYgskArlwiipuY5rzIA9r9yEflCxiLFTET3CZ66rM="
								"a hidden file":          "pZdY64UOjSJxS6AHQOlUW6dDTOS5Z2WmHJnNJw7xs+Y="
							}
							code: {
								"a code example": "TbnR82ELtPc+uXEqkNM8DAddBfqi0CR/2g1YIpYpNp4="
							}
							multi_step: {
								hash:       "VLF54FIL8MKHI6EQ1MTJEB2UIE659INRTMG4NEKKN4FFA45AD2V0===="
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
