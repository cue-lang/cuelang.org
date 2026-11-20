package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "9GT4Ak3ueqLFlUZl1zzCkF7ApXSWKw+qFRp3AExq4m0="
								"1 new": "cfNY4C0htdZ5Db4IikfoBcVZM6YvjScyUnBf+a6UT8o="
							}
							code: {
								"2 new": "5lV12GivEPZ/kHRgN/xX7T57PQDK4MsejAFa08CEkS0="
							}
							multi_step: {
								hash:       "NJD178AJAB13GIH68AQDCROICFJFVRB9ND1JDSU0RJS7VKE0F6AG===="
								scriptHash: "BH3R2K0S9UCKUIJNB3BVM08QAKAEA3C7CT6KJVTLMLNQTTSQ0EBG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261119142547-4feb85fac20e:$PATH"
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
