package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "MscgEJ9GJqcnnA1udkEblG7P/zFnbFpV+P9SnJ0/s4U="
								"1 new": "ffaUafKNkbyThtikieufh9QuxULXAqoNNyHUSLZddVs="
							}
							code: {
								"2 new": "ulrWyHawVViqUkQElw/gNsy5ERZ5qst9c7FBgOuGFEM="
							}
							multi_step: {
								hash:       "PGM18KL350FHAC6GIP7E0010QCPA9PLI98VBTPIJOVF0CK00K3GG===="
								scriptHash: "38N7AV9BIJODB1EF6QBL8JP4S3OF3QIOP1S4DMOO338NOL185VMG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261113115251-a5a9a9c5a2df:$PATH"
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
