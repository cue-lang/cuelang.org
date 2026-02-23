package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "AZ0hj/faTQFf/3mqsu/6tDNOahQMLEuTzaXslSwDFyc="
								"1 new": "ZPxrWt5R2xYOB7yzboFig6Xz6nGblJeTAn6RIAam40w="
							}
							code: {
								"2 new": "wvPJPGHbM0JMsS/UG6AiY2I23tJV85xR2zJeNS4MV5o="
							}
							multi_step: {
								hash:       "3PQOV7JDOIQ42KHR1O7R465K80V9BOIN4QIDMVI6UUB1EC8D1OF0===="
								scriptHash: "PB62HDMAGIPF9AJSCBODJH9KJLDBL8MB2Q0SRMTPRDJPURAQ8F70===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.16.0-alpha.2:$PATH"
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
