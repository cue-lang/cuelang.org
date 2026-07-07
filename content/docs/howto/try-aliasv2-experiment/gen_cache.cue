package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "pkp5lxqs2p0Cr99LgcWtWPTo+S7ZDn+ByzNJHGkteAw="
								"1 new": "H9ShjGapmzQX1rDLU/ZB+YZbo8E8hxkfQ8CGDFV6hXg="
							}
							code: {
								"2 new": "PwSEKtrHavw1UrBIwNukSzLlWjNWJWQh0bznSWDUoSY="
							}
							multi_step: {
								hash:       "K3GR9JML7P8JAJ1FFJG4SN3J7M2OLPIMJM983PRHP4BLQUJGQD3G===="
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
