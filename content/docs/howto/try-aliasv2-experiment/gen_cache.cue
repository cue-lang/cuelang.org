package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "d+vjxqVqF7l9mM8WQ57gPA7ZlK65KPuZ4Sb3JW6FfYU="
								"1 new": "uw8ioOSvtudt/7uEjuzhFfi6TA0wDizjxen14/piZys="
							}
							code: {
								"2 new": "3Ym95NI4qmFa1Ls7g+pl9DFRzhM93tsHcjcFYxldb5s="
							}
							multi_step: {
								hash:       "UJEAPKB67H4GB4A6B90L80T0EC7DE8DF7PNB9HABSNI40HMGL1BG===="
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
