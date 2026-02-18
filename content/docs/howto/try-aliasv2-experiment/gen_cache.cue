package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "t7oiQuUzRrzQ+hWM/Stlg/oQiUWsjtZ3ngegHfytzIY="
								"1 new": "1HjO/Jzh8Pus0uBhTHmVTBf91WDXlLJHnNSUWi1DJZs="
							}
							code: {
								"2 new": "gz5iZ+mAc2VH7Q/4RXdO2LiObJ9maO/wJHMDlRKcOnI="
							}
							multi_step: {
								hash:       "7MABDBTD11AGUDQBPQ91MTFE6FOED6C7UM0QQ4BQJ8RMS3QO1DH0===="
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
