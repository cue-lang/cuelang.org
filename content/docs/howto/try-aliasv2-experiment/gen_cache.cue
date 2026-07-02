package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "YTLm4JYAcAOgFMm7bzSyps+mcFLPmFMZMBi6frG2kXc="
								"1 new": "8Z8Nont/4VzhwIqt3wotlwHanbcOTHLMGwOhb5Ma9VA="
							}
							code: {
								"2 new": "SYhVyeFp5WCFJFH80goonpIR8zUxY84uPa1uP076US4="
							}
							multi_step: {
								hash:       "0TUOTK9J604574JLOVJQ6BAUIIBB47P2CD7I90QP03MP6PUCVA20===="
								scriptHash: "L0G074N9TJ0ES1RS0BPRAL7ICVG946ONB917IM7M222C7QO883Q0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-0.dev.0.20260702073200-7686325819d2:$PATH"
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
