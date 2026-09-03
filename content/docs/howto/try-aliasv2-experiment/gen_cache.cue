package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "aPBcUWlTXShOuQdlCvk/rWfY+sER+AdFjV4i01qckWg="
								"1 new": "P5Yu3yJ2nMw0+PFaso52qjOiabZ3RTmXW4QxqoNlz/w="
							}
							code: {
								"2 new": "HpNQzJXGebfkhPvQG97VVEOGUU4zAl4Tg0Nj+K7JvNE="
							}
							multi_step: {
								hash:       "R7GNCSOANLMI8114QHIJVBKUI3HI33BJKPUE95BF4MM18UF5UKRG===="
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
