package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "+9ylJ0G+h66q6FcRKgDNAKzAnnnxz+LJx3XLR8JF7U8="
								"1 new": "XMmEHGi4ioQOzIkHlArZLLJGeNVlLBZyEnFwbp5FJDM="
							}
							code: {
								"2 new": "rwRIh8Pe/z8ml6RHRSAMHjaSzU9P4/qNTHOy/lS7DBc="
							}
							multi_step: {
								hash:       "4AMQFCHRVQRCH87NKVIU331Q9RDAT1GVB5A5VRNCLI3EB7U9P4IG===="
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
