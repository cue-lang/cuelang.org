package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "mHlpJbVWKVNR00OESDHpKVBrrr+MuI7zuRwthZPTV+c="
								"1 new": "MT8SBjiCKS9I957LKNXzGOhr5YOZ5hPAWaR0NCgQSBQ="
							}
							code: {
								"2 new": "Fi3YCCp1e9HBvgp0gpB/SnL2zzj28KSNbdK+lJ2j/hw="
							}
							multi_step: {
								hash:       "PTI0O09F0F724BE538BH02E0MJF2N4S6QDB8VU5EJMJUO77GO44G===="
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
