package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "DxolUAfrchs9bwlfEk7rJloMIZT7t5AyKZA+dAtApYs="
								"1 new": "nxPfn5SpmUHekMpOyGDGcOnXNm3psvRuKQZjFTWcwtU="
							}
							code: {
								"2 new": "49o/cDoGgckZtwb5VXVZHrkzxKJn/Pjg/2KeyJYQYEs="
							}
							multi_step: {
								hash:       "NGD7JD5BHLDTV27R09JF6B7G7O0UC6T09J9C1TMC6C84DK2FTETG===="
								scriptHash: "9UT4ELM76C85GNSADDNMULI82LJPA5MIJ8CRU4FMCJ7VUGPCV0B0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.15.0:$PATH"
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
