package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "2yQanz1kjZvdPtBklnC6xdzZlcnx8r8TfE1TNbAxf6g="
								"2": "4hDprDaIx1T4mc6FwAdKAmOEY3ozBHIHFwJz0gEEfCQ="
								"3": "SxYTe07RjVZlQlzElkC4LtcVv1QNzLurHS5m6Vzz+DQ="
								"4": "C4vzZZsL6uL0Jab1jl673pIdYITsTD0mZjaBJz2WEiw="
								"5": "rWKNs8KO3FJetnN56CwkhBHXLP91p8BLjqgZNNCu0vA="
								"6": "4gw7HxINQmC8CnZ3NbFVDEsRMMT4E1fJGjooh2+F5cs="
							}
							multi_step: {
								hash:       "61JMFNGEL6CC6TI1IMUU8LRVRD2LGNRO39QT4FI8SV3P1DVQ6EJG===="
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
