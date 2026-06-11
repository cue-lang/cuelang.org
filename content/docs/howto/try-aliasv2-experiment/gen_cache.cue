package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "btj0/+vOxh3vcN9rLyxVhsQ3vWzYjzjfPlqXG6moIoo="
								"1 new": "knuZ4czG8SMI6XwtZ8NQ6WOX9MKrikV7zxVkq8R2emE="
							}
							code: {
								"2 new": "REgavdQXozSvn9E6Fc70wpWNJ6DSA467nskpXTrFOsg="
							}
							multi_step: {
								hash:       "7CGEQKHENH8S8N74200L1UOR1C92KDCS83P03BV5LIME7CGAS08G===="
								scriptHash: "D99PH3GLG49BSPLVK5VA5KMFDER4OMG82356BL0OBFJSARTO4ISG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.16.1:$PATH"
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
