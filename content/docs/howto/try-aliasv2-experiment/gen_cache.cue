package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "CBcEN2rQcoY73klR9Qmz1qAUgcGu+DLYSRshO+pVZ2k="
								"1 new": "h4LmkZ6O7RUcQlUu34NNkh+QEmR0FJKSlbetmJWVXCk="
							}
							code: {
								"2 new": "9JWg1DfQxY4DadqW6iW9UeZ4OVieoiDOsGr7eEtbezQ="
							}
							multi_step: {
								hash:       "S1CP5B84QP96LC80N395D9203BGF0DNJL86QTGLNM0E4EFCNDUR0===="
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
