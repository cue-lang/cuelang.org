package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "o2sNuoMPSVgdByfxUJdR6249w238JMxpmTenQ3WBXLM="
								"1 new": "UlMe6OFzbKoYOviokkE/cFQVLNLXcy1lc44TEv3/nfs="
							}
							code: {
								"2 new": "KmkXm9wfmTR8Dh/XTCQU2FiUM0vexFa51JupsuzItXA="
							}
							multi_step: {
								hash:       "O672GODCD74M5O0API88UV81FA62QUO0KFFU1OFOA9TNSHO82EU0===="
								scriptHash: "038387E3RPT9UD18J1KEK5T3KQ2IT5PUM5RMIT598EK4U2F4S1R0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.15.4:$PATH"
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
