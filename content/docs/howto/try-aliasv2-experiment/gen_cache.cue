package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "QyycP3EZtvmfwIEGvU5QP8J9g6L7vm+dsC+D/4S2Xt4="
								"1 new": "qo2u5PAGMh1DkplBs0u5nq+aQ8vxO+Ilu8cKne07o7A="
							}
							code: {
								"2 new": "eYL5q1VfbTRtIZzJpirxjzzDE23JM1yhdbCm3xGWgg0="
							}
							multi_step: {
								hash:       "0T2RRTQQNKFU0I8QTK8EUKEAD0K768967JLM23G3SOAK9J476PHG===="
								scriptHash: "5KNN5NPJIG3FF9P32KPKA7PH6682VC5S34LF6S9R66954OEOH080===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-rc.1.0.20261023142911-c9393fa32ac5:$PATH"
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
