package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "oGDZ7na2dBs5B7gU18QaL5++ZWh2/CoUvqKgndJmI7o="
							}
							upload: {
								"baseline input":   "RsFEPpfEHTeZZVZyCDnSAY8nqrd4cgfdD3ZLTXDp0Lk="
								"baseline output":  "tkDAQeJ3ZRedNIwu15eEpaHb3fG7LzLnWhc4lj6nbko="
								schema:             "5MB/xVhu+nFLmzo1EcZj4IqMM0W3CbC95f5VD6mMvko="
								"schema reupload":  "4pjUXKPpfufbUmwpNJSNqIySCCzEid/kXQ53K1XMHJc="
								"schema output":    "d4qgB2MReAXL+ZhC3tPyLwfDEFGIWQbh4688YqJz+Rs="
								defaults:           "+00X74+I8w0jg/6w+6JFpKzHEF+9pw/FsFBULZXI1HQ="
								"defaults output":  "nJvZYd396fIYhdfC8Al4V2Iv4wUNK44i8vvrOLqGrf8="
								name:               "YQwABKKDjQoM4hUgRn39br5hv+EBzpNLK7ehAdEGE1I="
								"name output":      "5r8acrDgdcLL62gXja+wp939hYqbN5yqsSWoND3/0/A="
								"extra app":        "VZIi7CfDzeVFkK5N0ZKxVRwIyEcDGO7w3p5s9gQWe7A="
								"extra app output": "kxSxzv1MzaeS+vjQ80veNqDhU1BdY84DVw3geag2kZU="
								"pre-trim source":  "kZRIPmdm79ZZQcMtgFLbyx2p1hX8M01q1Spj1VCWzGQ="
								"post-trim alpha":  "qmulO9S9PLZiwtRnis1QozOtTs/Fwn8jDU3juCe6G7M="
								"post-trim beta":   "MClLEN68bhD2lEA+Y649yRtPKVwJtlr66h/oLAN3SBg="
								"post-trim gamma":  "uWn7l5XHm/hz1pQ4K6e/Yy5uoAGUzLUZKYQuNUPvJgM="
								"post-trim output": "Ogx9j2HsqAMfDh6g2wEQUPMU22BGsu8hmrWhhi+HSN4="
							}
							multi_step: {
								hash:       "KGLNSPJQS1R3LL8NRIH75F96Q0F0KDSRQUVLMDO7OAG879V1CVSG===="
								scriptHash: "JIPADP79TIMUIMVVO8STGAUSB5BK8PD9HO8VR1AGQAL09MO36AU0===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
