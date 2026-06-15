package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "kPQZbsm+dKlfrW43/vrukJVKA+Xrm2dQtJfoNBFhKh0="
								"1 new": "OuJehcQy+bxpwYHb4mSDVnAOvqG/k6Ka/OotWGCbNeA="
							}
							code: {
								"2 new": "J37uiJfTaGq2ozMPRJ7LihmXCG+ZAfdPYXmka3s7/ME="
							}
							multi_step: {
								hash:       "K2QSO0B22570D4V7RQ8TCITI6AFRK06SCVATDG97CGKDUFIDO310===="
								scriptHash: "D99PH3GLG49BSPLVK5VA5KMFDER4OMG82356BL0OBFJSARTO4ISG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.16.1:$PATH"
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
											d:
											  e: 45
											  g: 44
											h:
											  foo:
											    i: 47
											    j: 46
											k:
											  foo:
											    m: 49
											    p: 48

											"""
								}, {
									doc:      ""
									cmd:      "cue export experimental-syntax.cue --out yaml"
									exitCode: 0
									output: """
											-foo: 42
											b: 43
											c:
											  foo:
											    id: foo
											d:
											  e: 45
											  g: 44
											h:
											  foo:
											    i: 47
											    j: 46
											k:
											  foo:
											    m: 49
											    p: 48

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
