package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "QqmCV6G3HhnPwZbA/VLptnWeYbLQ4QsE99bcoT051wk="
								"1 new": "0w5/sss/dgVqd6anuvoHyaSBeKAvrqFgOdgA94P4Q2o="
							}
							code: {
								"2 new": "9dHiel0tea8t1EH4e4xnwquERAkOy9UZC+kghFPmqUY="
							}
							multi_step: {
								hash:       "B0MKOGB6QDKVGKAKM39UGFM0LLJ09LHI629GHGCVDMLQCTI6VDQG===="
								scriptHash: "9OADTR44B7K95LHUU81JHAUOSFSP5BI09OS2R4R322UMR85LSSLG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.17.0:$PATH"
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
