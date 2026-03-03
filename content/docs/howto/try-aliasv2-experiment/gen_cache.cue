package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "PAoC1klrEyvIMfvDUXDQBQAYTRu7U7GFdYwVaMujkMM="
								"1 new": "Reu1tIxUcqHnqDKrgIqK1Y2GfhuhIsAtA5TB16CtAD4="
							}
							code: {
								"2 new": "0T7PbUBpctWMLj6E2WO72KjD4m2fW6Etzzzn2JgnA+Q="
							}
							multi_step: {
								hash:       "90E8E29IP67QTIR9PPTFHSTI7Q0GECNJJ51QI73VMQG4TASOPD5G===="
								scriptHash: "GTCOPS6HRHBMG2V795BQKE4AD1Q1KE08UVF9M78F964R8DPTA2G0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.16.0:$PATH"
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
