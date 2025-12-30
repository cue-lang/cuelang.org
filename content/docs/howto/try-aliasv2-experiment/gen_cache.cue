package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "UfCFVObzcKmlut/7cYpKwTCP43lS2lAmgSl1UpKplMs="
								"1 new": "bzjXNH4S28v3B48cFni1oZiwFWqlPhLzYfic5Efha+k="
							}
							code: {
								"2 new": "XfyHf+9oRcHMdy2vrHLinuRC9iToWYrhcrvR6AV3g8Y="
							}
							multi_step: {
								hash:       "I8PLS2T0MP7E99LIP259IL6A3UG1HSL2416F9DE33BJ8M8RLQJ40===="
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
