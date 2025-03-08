package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Gr+YfyUokglHi5yTalhOrsl0yZTA6seCEkNzGclS5UQ="
								"upload additional file": "57FWPRHBASfPJ/Xei5fqz2osXqNrwrxyidaTekhmA3s="
								"a hidden file":          "Ial4NRBv+HjtvBjOyI6Imq9I5hTtFqs+n7nSY8Lchfc="
							}
							code: {
								"a code example": "5iWFMEcAxM9Zott7uCDA/+MAGIYGehEPUtnvPgSAp/4="
							}
							multi_step: {
								hash:       "CCJUBMVCSP62O3JIJBKFP6OI19BJ59F14IME6OU5PNBJK73DC7KG===="
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
