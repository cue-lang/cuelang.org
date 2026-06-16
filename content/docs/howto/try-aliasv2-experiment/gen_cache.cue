package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "hhKAN7XJK7KML9fCcBHSbiznKVceyWAw+K/BXpGvIkY="
								"1 new": "UVawK4bKVBNVjBaf0LAuzhOevOpO8+AxXeoAOYKgS3U="
							}
							code: {
								"2 new": "8/9q9xRZ87Uw4k9uvVdxccYkLutmzPDlhGTR5EQkjWI="
							}
							multi_step: {
								hash:       "G4FNRCA47MJKHSRH9KUETIV20KGEISE7PAGAA7RT89TIR2H9UVVG===="
								scriptHash: "O6DHMRO6J58BRM8TJFURPE62B0UP6AVL7485CFS1J1S50KO96G6G===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.17.0-alpha.3:$PATH"
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
