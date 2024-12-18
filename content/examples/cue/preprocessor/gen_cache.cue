package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "I91YVk3vGmURo9/mkA+oFX5JmibdE5KWlLQHwOKwl3Y="
								"upload additional file": "a5XIMlswP/EhVqe4guZ5bRvSALigEd0F10CAb6CzhvY="
								"a hidden file":          "BAQs/d8VjCksi+oIcO4YX8pS0DNnm279jORgrYaQ+M4="
							}
							code: {
								"a code example": "VZyR/OokPX6h1S29Z1BUCh+9exgbHU/GxtEGwe5CG3U="
							}
							multi_step: {
								hash:       "9DIU2KNLUE95SHOVM1A2JBHU9MV600RHF4OVJ07QFPUIJQT4FS0G===="
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
