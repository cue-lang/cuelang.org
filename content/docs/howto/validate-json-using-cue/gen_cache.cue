package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "5QewMlRMrxqaNnEJs92iilSldipeoJVSc5xTG0lPRMo="
								"x.cue":        "bcMkrrvJWqK9KMWq/jRIIPcTyiMZHy7nqWVYeG3mKKM="
								"x.json v2":    "g3Ri2JfTrG6Liuccr2j19e7b7s9H5udXZkGhJ+IOcVs="
								"fixed x.json": "tYhCik18/FSwcjCu3wOA6shrKBYx46hfUO0X5wqsXNw="
							}
							multi_step: {
								hash:       "M2IPJNN2F5SGL97K9GFRSIVRITGC21SMNEQR2P22UT7MC3MOGDLG===="
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
