package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "IVO/l/LiucCuCB+09IrNvrdonreqeT2LW0uChNC5gn0="
								"1 new": "4udaL2EjGLvGAR9hS2McarI+oHdQBAubNVd8ITA9XZQ="
							}
							code: {
								"2 new": "hnKrnPajR6YIrUPNveT4GeMNxGF55RDs20l4SD9/Fpk="
							}
							multi_step: {
								hash:       "QGG05PSI1ADHPHQ5R1C529IHLOIM93Q1FQ9KLVO8ND9Q57AAL6TG===="
								scriptHash: "0VOF75ORFQ0DDQ5BK9FJ6AK18O5FQNR111OMRL2CIQ14E1HUNQ80===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.16.0-alpha.2.0.20260220153551-3dfa50a46189:$PATH"
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
