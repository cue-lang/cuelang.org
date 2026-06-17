package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "nkXJZ2kgdNZWPRCu5a65kZuCwHuwCIUqH2uJSdUKf2Y="
								"1 new": "6eM6upawgg6YHoLj+kIFxJHCxOHFd7bV2v4D1h+1NCk="
							}
							code: {
								"2 new": "8p6ot0vKJJgBLK833O5hhniwMmhYamTFN7XXVCkBfY4="
							}
							multi_step: {
								hash:       "6ERCUO4FK63D54GK91O8443B6P08BKNAPOBEC9EG3C3KIMBOM5KG===="
								scriptHash: "O6DHMRO6J58BRM8TJFURPE62B0UP6AVL7485CFS1J1S50KO96G6G===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.17.0-alpha.3:$PATH"
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
