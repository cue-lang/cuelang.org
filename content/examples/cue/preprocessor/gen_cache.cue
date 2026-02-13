package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "8NA+KhlgPutfCuaOVsfZTqnNHkCixvQ5lzZGUQNVvPM="
								"upload additional file": "/eugNjX8hqa1E2cXKr97xCa+7IzHORzVXkJaBVDBhwA="
								"a hidden file":          "gWuuPljOAX1TtAExiTP3citYw7yDNVTqJNl5elE09uw="
							}
							code: {
								"a code example": "i6j/RaKftyaTUTLCwTH8aP1uNMuyu0Fx75Bd45Gx2i0="
							}
							multi_step: {
								hash:       "5ULNJITOK9QTHU05D4DHOTK8C6BN08SQ2ESOFFR67TKKPMP5I6O0===="
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
