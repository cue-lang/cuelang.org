package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "wCW/hkFYSObF6bxvP2Si/Ke1rz2owKczD+6PtCNA5Dc="
								"x.cue":        "kwR+9qsgTe/GW6wujn6ngBfgaYqixhALzaxNUCWHD98="
								"x.json v2":    "6uLI/HbZKLNnXioW0z29L2ZIlno80bMCRTzD0c6mNWo="
								"fixed x.json": "flHWYuTVF9c+ieHMk4becnB0K7zGv7tFyj1GA9Psz8k="
							}
							multi_step: {
								hash:       "4MFPOVJHKF8RE2H7ILFANPC8KGLQDSSE4F1NGT4VK415TC8E1KJG===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
