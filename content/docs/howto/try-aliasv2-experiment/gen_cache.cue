package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "b5shRUmKaBXziFcLDHY3XnOlZn02EQiy2IDwiM4y3pM="
								"1 new": "oHjhmy34k0ju0IXiKxsUBO1B+h67PPUpkmMtE7faVjI="
							}
							code: {
								"2 new": "mP7RKTbzuQI1f9kXvrys1TmIyDh8qX9wzoMYR4KGUw8="
							}
							multi_step: {
								hash:       "5EVF6G6RLDRI60BSJ81D2FFEPT99L03N8PHT4EGQT3JOBJ1HI7S0===="
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
