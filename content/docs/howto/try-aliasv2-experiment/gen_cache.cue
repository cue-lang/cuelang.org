package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "yDpmTsKZ87sjSJo2Uz9OyZbEK3WVryDMttk5b9MkysM="
								"1 new": "Gm557f1gffA/HnZfmUQ94qMH6VFq7kHSFVPu7sPNOWw="
							}
							code: {
								"2 new": "kcbt0MMQwASB7BlXUEtJ+Kb30PMD0avpIT5Vd3uFYq4="
							}
							multi_step: {
								hash:       "O1V7QN07U7UB5SA6JJCSBJ7NRFG9F8V9UQPK3HSP9JDBSBJGOBO0===="
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
