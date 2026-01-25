package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "dNIAJ+9XhwQJLcLWgFjSw4VzMgpLFM36RFAGVltho/w="
								"upload additional file": "y2mDI5CSwEp7rFjsMY3Oow2Uucau5aGNuHQbw3iapzo="
								"a hidden file":          "8JuE//UfwuPSkprACeld6wHL6NeAERtvUJsKwETuhoI="
							}
							code: {
								"a code example": "Lha0QRPyqXURRFDyW9YLkdkboA9V0WgwvgWVfx9EFlw="
							}
							multi_step: {
								hash:       "TSQMVNKM57TBT23C4D482247E4RF1A0EL34A5T72DGCIF9209C90===="
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
