package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "mQ1e+sMshRCtE2QwJg5wp6VI1YAyNxtGpOape6uMU80="
								"1 new": "F18pWPS6m8B2/mkMfyeqQux0zgxPJSPWPGdqNxWaBpw="
							}
							code: {
								"2 new": "lhHX17b6bWne+1zk5PSURfQuQVR0biKRnNi0lXfSj6Q="
							}
							multi_step: {
								hash:       "7QD16FTFQHFKCH3AQ7HJA490VNUGLIL0JTL7E2CGA0F0C0JOP000===="
								scriptHash: "IA1MIQJ2NC6U91P38BOD5IRF56OSCBRBJ38GK6CJ3LMTQE5C5OEG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261127222705-d53722b2b9cd:$PATH"
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
