package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "QYcvTXgn9QfDQGMO7V56OhnUpBYz+ayyegpqM31vcsw="
								"1 new": "QWvsXxPMNVqn3yaBIeMrY6dUuoQb4Aw5jvhPeiiJOYI="
							}
							code: {
								"2 new": "kRsZCN434UKia5Wq9X3Yz8N3h9PKn4/sU1GZGvon7S0="
							}
							multi_step: {
								hash:       "RA3R0LM6188F9CEM0FDSE2HT7JF1OO28BBKC38V8IJUJU2KGQ7B0===="
								scriptHash: "8BOQAVPNN9MA70AT376SGRKR317CLCNG7G9HFC1B57DDHIE74VRG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.16.0-alpha.1.0.20260213130521-9e2dec3b9a23:$PATH"
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
