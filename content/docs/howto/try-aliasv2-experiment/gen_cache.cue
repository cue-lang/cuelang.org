package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "Dlg0ZrbrxYZ+5Xmrb4x/5cCB8CXR3hY+UCBujPCaYQk="
								"1 new": "ajh03FpU+LvR6cO/uJRl+JeWNA4RC2qqcB+u+jZ8uTQ="
							}
							code: {
								"2 new": "b0iuP8X6zTLSe5QM4MTulGfCKK9ZHXmBJMZijmHMnWc="
							}
							multi_step: {
								hash:       "8HOPL65A5EV934KMORVMBBK8PLU6J0V78MGMRHI1TR3DBA8II8OG===="
								scriptHash: "3RGQ5C4THIC31K1V7AJSNATPI1QQ4JCJPFLQGBMDRGQMR7TQKR00===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.15.3:$PATH"
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
