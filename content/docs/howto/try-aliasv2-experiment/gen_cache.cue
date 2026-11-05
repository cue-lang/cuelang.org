package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "4ej+UwhfPz+5Xs2eIkubJZN3hJgqkMrYRTcpjGNIbFo="
								"1 new": "1MLtjg6eREJDe9ZrRgCzn9T2jDNC/GxkKEtTFCImXp4="
							}
							code: {
								"2 new": "KWbXxWVkpi9XmLD/QMi7PyipxRi0O486TpTASHZLraU="
							}
							multi_step: {
								hash:       "BTF1P7LM42NB2UCT23FSV6M3610DVABIIEKHD2G1UUGNFKV6VLA0===="
								scriptHash: "9E7SKMD0KTKDMTMT2I1HQRNMSGSV54H0UKKSOPVDBMLCJVBRTG40===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-rc.3.0.20261104170309-b057976c6156:$PATH"
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
