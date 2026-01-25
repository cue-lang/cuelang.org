package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "NMjFRKMaFolA1MdljZeu0OjdjufSb41TfKAYZUnHh/4="
							}
							upload: {
								"baseline input":   "pqnQdHnwjPODuVXZtrA1CH7uB80v5Ol0FtQaPyyxesM="
								"baseline output":  "2Y4Oh3nSH/kOKCFkOfjzt6b+JD7FVmHqP4QjQHNzZmg="
								schema:             "4gq6nIeclYTpBEgVZDXDeKdAllbZ1oqA8/xH/UayJnk="
								"schema reupload":  "hYP8r1mnlESZuZYiJE3jOwwdXGO0R1bERMADjH1Mk84="
								"schema output":    "LnXoD8FzE/iqlLPx80jm4R3nMPveQ3Le9w3La60tX3M="
								defaults:           "Uoi7Vp7GYpmebv6+XvFGmwIYpIF5/ejLEHLZYVX96Mk="
								"defaults output":  "jAos0MEoDd+Nzyo+glIK4ncBxAD1LpqfN6brzFIU7fg="
								name:               "c4wFcoZfckvie4/w/z548a/XLlDEYaumZBU/nfMCPr8="
								"name output":      "JmrPGP76BzfEd6HYN0jDCJCy2qTa6Xdk1L7jnMk/0us="
								"extra app":        "yhP6EaWLsgzPzv+NZC/F2GEK3wrCXg42CYmiA0L2E5E="
								"extra app output": "a4YJ9HcL5ctkAF7Mp8ygW8DCJhsFNzJv0fdDc4QxGH0="
								"pre-trim source":  "2ZxxD5CoHXtfUXmBVpq/B1BOx6617hJ9lAp/ktCemaQ="
								"post-trim alpha":  "Iz6UaloWay3cVAWoDnWA8zoiaN5nwvuu+YIRZ6AURbA="
								"post-trim beta":   "BF2D7cCCNQgwLEZIfTsEBTdH9eZZG6tbj2ZCx+iVIhA="
								"post-trim gamma":  "ZLZclwSybzZRR/JYnBne+gC1nAs5ga1LFcOpmK5h9Z0="
								"post-trim output": "Xzyh14cpU+Z3mjBL/fdsYTX2/LFOLCUiRz9QKPPjcRc="
							}
							multi_step: {
								hash:       "CIQ7KF3UMEIVQL1N9G9DKRDSNV351TLRS3LO3BTLA4IP2AJ77VVG===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
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
