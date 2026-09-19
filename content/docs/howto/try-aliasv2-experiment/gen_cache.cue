package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "JjjaD0GFr914dhyMadOEpXn2AaNh+qMW/1u81EuQ48w="
								"1 new": "VcrGp8BQJQCHk6mvSLONnvInXpT0HLs8s1X33vcATP4="
							}
							code: {
								"2 new": "IAjgwCvk3pnCMUEqMFEV58q/mXghAuVFdjfQA7/GMZg="
							}
							multi_step: {
								hash:       "LJDKV443DUQIVEOPLPGTK20U3L3KU47H40VKB6COIGOH8VTUUILG===="
								scriptHash: "A33THEOMOADP4JGC01BQ39A5MFOTJ69LRCJ2VMONHA56Q8HAIR60===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20260918143709-50e1f64b6460:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init --language-version=v0.17.0 example.com"
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
