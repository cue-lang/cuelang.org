package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "5g/us/PlsdT3cEn9wVwbWm5S/VkMtqGX4IaI11GzC8s="
								"1 new": "MbQMhtjMV1QyVGNOvI8NUSgijAVOHMmWYdMdfpJ4YAg="
							}
							code: {
								"2 new": "YkVGa9JMJ8798YxTJjToR5iYT0fpCLwgCJDgolVN8LM="
							}
							multi_step: {
								hash:       "HM3052LB1GSLJ92Q7VLG47PBOMVTON21DUJ6BN2FLJRJPSJDBS80===="
								scriptHash: "4R2O1CNA33DNH8J1EDMOTUQEM13MEOBCM89805RMDD714P907BJG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-alpha.3.0.20261008224848-a4f52c2332e4:$PATH"
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
