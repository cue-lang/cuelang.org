package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "dsA5q681n7VpCgYpIqjytb+24atcR72OwsNI/wvJSJA="
								"1 new": "qPH+we1Se+P2owT1IRVEjtjESNiQg2kynumOH9WRXZg="
							}
							code: {
								"2 new": "pvnIyRktWsnVfE0ZlInC8CP8l0L5baj9E5A+cFuDoI8="
							}
							multi_step: {
								hash:       "03DSAL2VBRKI4STIJ2FIN6ND996M8K99VATTE7ACP18E6T18HC8G===="
								scriptHash: "3RGQ5C4THIC31K1V7AJSNATPI1QQ4JCJPFLQGBMDRGQMR7TQKR00===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.15.3:$PATH"
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
