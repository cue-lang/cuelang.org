package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "6Sd5xwZo89hE8rwyRUvkDm8InPZ+TcgeYJFs2nIAntk="
								"1 new": "cj7J6tZjpchR+i6jBxlEKTJObuMsjMx8Y7EEqkrUjV8="
							}
							code: {
								"2 new": "ja1X8slw0eBf8bpC6C5Ic4yWb4IGd3nOzCtPrj/IidI="
							}
							multi_step: {
								hash:       "HJIN5T819I42763TU2FFSLRHTRLS3FLFODJCP51HH3B1S8OFH3IG===="
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
