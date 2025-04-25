package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "nIi2ZIE4lTMiw58BR+5pIN8vqAMUyhf1c8z6nRGfa0A="
									"stdout yaml":                "rvPvbMOOOVZfzWfeA3Bzus7yxgsj7kUmgUvGAENIVMU="
									"yaml:-":                     "110yx7phhsBWQBBSMhK3L+dOppiibce9ktowp1Shloo="
									"--out cue":                  "t3LliS0qyTOxwUAEQWyblaIxw5MuyfnGN6mCQRHnjgE="
									"--out cue no hidden fields": "NppGpoxuzee71FKHviGA06MokrNqJqvDRisIqecoBmw="
									"--out cue --package foo":    "F2m0VAo1ysHLx5J1+kmqjou1GUMI202VMfzS6fP7GGo="
									"--escape":                   "1zxyNXMgtuBBxk7RdB+fD5ZOlLfjV/6pnuD5IIRH69k="
								}
								upload: {
									"--outfile data.yml":            "wucja4T90MW/SY7LVJ/Q9d0pfb4FSNRA/AXS1qd1QUk="
									"--outfile data.txt":            "x/FusEdk4ocBieVh2js1PgcrET2yatkkvvNtyvxdyTo="
									"--outfile datafile --out json": "yDDlyT9uMzQMhZMJv8ELxr6HttWBeqlODyA9aVV0wLY="
									"--outfile json:datafile":       "ashfxDdcoVq92CiDmZpu9nhzF82s1+pOkzfn8c2Dv1k="
								}
								multi_step: {
									hash:       "5M20BLB29VL68CKDQA5KQUCB6O4EJ0188LAGR4IAE16NEEC4TFQG===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
}
