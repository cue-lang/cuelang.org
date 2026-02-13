package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "7VH4sbhAFCtW9SnSLUYy8t1QsizL3jULyrzITjMgyIQ="
								"1 new": "nsS3WJ8mKTiaJRK5sL0TPsgYTIFWAn4SLpkBeZI4Fqw="
							}
							code: {
								"2 new": "snZrMjhA4LzTEd8fiEYeaxfyjJRO0Qyd60PgIdrRjrU="
							}
							multi_step: {
								hash:       "CVFJESF6JEKGUKDJO77Q24RUUP1EFP6ACQLVP3CDH68U7KJJC6FG===="
								scriptHash: "441HBFTMAI4SM712BHK334K1NHFLOHB7OTOGOKJT9MD3MFOS8810===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.16.0-alpha.1:$PATH"
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
