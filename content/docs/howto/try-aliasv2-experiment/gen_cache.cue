package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "OVrebEt25y5gZqEY1kbImsEfC7KdJwpiUb9p/2nTyYY="
								"1 new": "4GElkKeZM8JL3O5fIbMsk1hBMyp/pnew3baxDuwtixA="
							}
							code: {
								"2 new": "qt0np9iXscKfoffnTcZLGKzmwsCktJEepq+U7QVfg8s="
							}
							multi_step: {
								hash:       "5QEVEKQ6SJ6IRDQMQG8T1FIU9OU3AQ90938O5N7KTBVBHCUJDA4G===="
								scriptHash: "VP628UKIJBREJS1K6LE8QI5LOO5GH3KA0P1MRL40GMCOIVEVMOS0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-rc.3:$PATH"
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
