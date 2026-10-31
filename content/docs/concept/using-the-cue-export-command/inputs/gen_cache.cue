package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					inputs: {
						page: {
							cache: {
								code: {
									"cue export # package x1":                                   "6VhYlbWpDD4ulG/cWVclHhM7T2wOj5ZHVC+h/CRVAoQ="
									"! cue export # package x2":                                 "2z+IesQaisvCTAxjBFHeSPi0G86k997bWCOwpmR32dY="
									"cue export . # package x1":                                 "xuG3kAewR9XmOkUq7D4bxkj5WFhv5M/AcBFSnu+igdw="
									"cue export .:one":                                          "zlUvVb+nXoNOSHxnTNWypkjvUSTOMVO3CI2J27rzr7U="
									"cue export data.yaml":                                      "8F2uj4WN7CxwquGaXr1Zecz7XZ6MEtxACT0NTaG92Ko="
									"cue export yaml: some.yaml.data":                           "c0/4eWNZfFctuQ/NhBmCSZNPyLwY7LMUC1/RcSkZ13I="
									"cue export .:one .:two .:three":                            "b6hd3DYl+o0MhlfTH3ZmGmqOSfaDAUjs5SkmQnwHrck="
									"cue export package + package file + data + packageless":    "KfJsr1WnElWGzGX4dm9wk6CzXfrDx/0pZvVwNCyb0wg="
									"package file + data":                                       "FrYa5wAGOFeXE4qEqARSeJ3sAMQOTQluDsmDGiLyjGc="
									"cue export package + 2x package file + data + packageless": "SMnkUaktyKp3rQ2nsRBD+fs6cx8vZHBHCRDBNPkYmRU="
									"data file inputs":                                          "aBzdpSkAvAUkmkhX2WvMn4gbbOZ/gnNMXgGF5iFl+Sk="
									"data file inputs failure":                                  "t+cMVSPPQvatayMXqPrTiKWAgPfGKo3adPBxwCBLogg="
									"constraint file validating data":                           "7GRf+17wti4VHPw6e7Ys8673N5ma7eLIK0jSjpvvQZ0="
									"constraint file exported as data":                          "qBmhnqwQfdGKIeCXRxeQDdjA6Q4Pprw1aX2SU/6+PyI="
									"-l static single":                                          "9X3jCqzt+IP6A5f7/7iCgbZYysQOCs2tx0pcb92uIs0="
									"-l static multiple":                                        "VqzK3qhAaTU8D7LvqAO92PZT+4JukdDA2z2TnKVikUc="
									"-l static multiple files":                                  "rr8K5CQlb8u3c9GVPZ/LjqMv4lcdQ2VqynS4Q3eSwzE="
									"-l dynamic single":                                         "I0xsS9IXGisjIWX1sVitEL6m7MfaPmfju8vqJKRUTaA="
									"-l dynamic single with function":                           "J8io+AjWvRQ6vQGI3ki4GqhVOwP9NvBqgs8dmRzHB8I="
									"-l dynamic --with-context":                                 "fsQCHyiuX2poGh+2gdCAy62SJv0ysIYulUceUnZL0Vo="
									"multi-doc merge":                                           "jaYOwS1Mu70xxJrMJvX43Nv1Oh+CUOSBOj8c52ItjCs="
									"multi-doc list":                                            "v837nYGVHyrFpDYdYoRjdeJhLoXJzSnM1j448MkZZAU="
								}
								upload: {
									"stdin data": "bJFqh6oqwiZzqh5UBddssrEXV/nod4aeFFir9jXJ+oQ="
								}
								multi_step: {
									hash:       "8S89J38JNO83OL2KDNBR8NP09C564IUPBRMUP87F19T1L54J4K80===="
									scriptHash: "MJUN7HPDDME4DUAPEGT4MCDV62AAPOJFS9U7BF2FN1RBTEVKIH9G===="
									steps: [{
										doc:      ""
										cmd:      "cat data.yml | cue export yaml: -"
										exitCode: 0
										output: """
												{
												    "A": [
												        "b",
												        "c"
												    ]
												}

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
}
