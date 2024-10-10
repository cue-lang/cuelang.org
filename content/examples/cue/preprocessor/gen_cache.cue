package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "OlYIp95bqgpvYZFnqI60usi2rF01VCJ+YfosaoU4w2M="
								"upload additional file": "pzJBtHo321xPEw6yoT2sJWb0qDgpaXncx/pb/M0TS5A="
								"a hidden file":          "HmjScBP+opcLbQyS+v7f+x7W+hKlYYhqUASobq8S8+E="
							}
							code: {
								"a code example": "c6x2WagjuUj8u/d8nzgEwyUVUXnWu01NC0CESoGMmfo="
							}
							multi_step: {
								hash:       "SJAD7B21Q78UL89QD6RVKQTOHN5IHBKMIIC71GAINNJ97LJ2QT3G===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											y: 2
											x: 1

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
											y: 2
											z: 3
											x: 1

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
