package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "pC/xc4GEUgN8ds/O6sv9XWnew2mQSY/u7zf7HQ+nhZk="
								"1 new": "RVPUhQjVEzhNuSo+ULKpxM3QFxQjsZfMluJyO7svFfE="
							}
							code: {
								"2 new": "G054gnD4l83z8iQ+FcB658zPz/LMgL6WnCSQb9Rjk2A="
							}
							multi_step: {
								hash:       "2843UJ4PI2VOO084US7R2BSF1CNAJTHUTN8B0S5S5MELOM8DFE30===="
								scriptHash: "FB1BQ0F5LTH2JB1KQFGLM9514N45LT9DM3GM9J81H811F507SDE0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.16.0-rc.1.0.20260306143617-9147ea2b06d9:$PATH"
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
