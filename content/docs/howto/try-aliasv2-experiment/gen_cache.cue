package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "2uO034wm6Sge0GFNyad82XyGXOTkc2yCtWro1/E8Beo="
								"1 new": "KSl0eYEliQwydZVajsRTu1IyZUjOAhi0I7Sog+2itxs="
							}
							code: {
								"2 new": "80vZT9QX92dpWD/Fqk0l8LMNBtclRhXMBSvhA+EZY6c="
							}
							multi_step: {
								hash:       "9STSMSO6GDLON4MMEFF0OEJJG8NITO4P46CC4QA2DIICIO5OMN60===="
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
