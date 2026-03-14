package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "D8j6auZkPvseOjYU736+UX3vW0eNrG37y/p2NBseVEA="
								"1 new": "Mh6FofESRIALXr8NYlIXZ7xLOwAzNIlMeHCw1cwUbCc="
							}
							code: {
								"2 new": "yDcAdjS9ie1xlS7GU+hz4juBwgUroLzM5vPr/pjuAgY="
							}
							multi_step: {
								hash:       "9TE6O1O8993EB39PTFN4BVIR9T2MO1GM6I14EQOFSIH8OUJU86LG===="
								scriptHash: "2E9V5B84LFBH31AL9EGJ5DGFOMVOAVCKL7QV6V25RFEQLTVP1EEG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.16.0-rc.1.0.20260314205741-820e1530e9ff:$PATH"
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
