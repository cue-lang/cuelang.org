package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "vkCX3bmlmo8KUS21DdbX8Z/1ogG9hRDUbkzVD5Oz8ZY="
								"x.cue":        "ylCgtJA15bZheZC8w8IAQfIZbr/qPKqQZ/ZTeEHcZOI="
								"x.json v2":    "mA8FyxF3q5Rtl5uEvjhFarqssN0uWZUUYUXUKoiLUr4="
								"fixed x.json": "FZv2kK3otm58oBucrs+GHXjjRVwL6wlIpjXrGICvI2M="
							}
							multi_step: {
								hash:       "84TGVUTF4I51P832TJPG8L3AUT4H5DQUVH3B7L5CSGG9P104C1M0===="
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
