package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "iu2tm7JHTtcPAKPJ18z4XZ0Ns0kRl19vFQhMOLQd4sw="
								"upload additional file": "m6DjmkV/ZefGv9Hp8wlV7p1rtk7jxfSWRu4RtusN1/g="
								"a hidden file":          "Vm6y6Kuy+hk1r5OPZOlg72hMvEVQmP+Jqg7T6gvbUW4="
							}
							code: {
								"a code example": "k/84RHm7dx5a973ISJx0wgPI3PTkpLZf+QQ0WOd9muI="
							}
							multi_step: {
								hash:       "P3EEO9R4FRMGNG4GUI9E9O4D7EV5R9S6IHTVV7MFTH90KDGURG50===="
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
