package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "L+pxrbBD/Hq0mmrYO1gGNYMKnXz05hbmWLoRNqCGG50="
								"2": "zdRgSc4+aOUwo6U7GMPjTu/P+G0GrwpqwGLhA6MVDFA="
								"3": "0XhLiN3D2sACEbg1w1iQLMRhMNlOWiT8HFuiVcwkbW8="
								"4": "vXeU/JwYKzG+EG851nAI7u95b271/AumU100TVslpMs="
								"5": "5KsDlnLjLSAoOtzmF+soTJErSo6KPEeXXToFxTgQgos="
								"6": "/PNa9Xk1MedL/IfNlXBWleQoToNiktegcZIaLNvrKm8="
							}
							multi_step: {
								hash:       "JL5APKDPPDHOQJAPAQGK2L0U8G6N5M5GM9MH5VPPQQ1BUM7KJCJ0===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
