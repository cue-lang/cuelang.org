package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "+nQf4eFv6dh2D8rwFYLmaBFoGudeoYJYwrK9OyYkcLE="
								"1 new": "P5Yu3yJ2nMw0+PFaso52qjOiabZ3RTmXW4QxqoNlz/w="
							}
							code: {
								"2 new": "HpNQzJXGebfkhPvQG97VVEOGUU4zAl4Tg0Nj+K7JvNE="
							}
							multi_step: {
								hash:       "DNF8MO6E9BIBPJNH0QL6VPGLNMSQJ7A56A8C0NE4LVMT8C4QL1MG===="
								scriptHash: "RJ1B2CE69SEF4HI418EN62U0DQVCBRGHOA49VF5D8CN5QSC1LUQ0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.17.0:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init --language-version=v0.17.0 example.com"
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
