package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "ZUPm/Hq0KLoU+jOknVooqdviLW4Zqag8HJD4gvssL1A="
								"1 new": "b+aYL9p4fEwlNTsfHcd+/rbkAcsO9iQfS8xDdk1dKEQ="
							}
							code: {
								"2 new": "OumfrynMGPVJgKxRuRNKOBKfv2Obtiolcv+5yl3FFwU="
							}
							multi_step: {
								hash:       "30C59T8E2BE96DG1C24HCIUEMJ9MU7VB6T2OHGFPVGLP07R4JS50===="
								scriptHash: "HGV0CBSG2VMH7MF080BK9QS6G21GRAI1PP9M0U5FETDN2PM3T58G===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.15.0-rc.1:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp current-syntax.cue experimental-syntax.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue fix --exp=aliasv2 experimental-syntax.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export current-syntax.cue --out yaml"
									exitCode: 0
									output: """
											-foo: 42
											b: 43
											c:
											  foo:
											    id: foo
											    "n": 44
											d:
											  e: 46
											  g: 45
											h:
											  foo:
											    i: 48
											    j: 47
											k:
											  foo:
											    m: 50
											    p: 49

											"""
								}, {
									doc:      ""
									cmd:      "cue export current-syntax.cue --out yaml"
									exitCode: 0
									output: """
											-foo: 42
											b: 43
											c:
											  foo:
											    id: foo
											    "n": 44
											d:
											  e: 46
											  g: 45
											h:
											  foo:
											    i: 48
											    j: 47
											k:
											  foo:
											    m: 50
											    p: 49

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
