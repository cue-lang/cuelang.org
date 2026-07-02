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
									"cue export # package x1":                                   "D5qKxlzpsgU0VR5jlMfmc7B18EbAliTx/Q1/4hXTkHg="
									"! cue export # package x2":                                 "tcqICvNdCxLmNMAseGPihEz/5vQRI2ElSDNu9acQtQk="
									"cue export . # package x1":                                 "v54/p0qGqcnmONx0YUFGcvkrRevAgR1UCqC/5mD5jOw="
									"cue export .:one":                                          "iCOKgLZ+NleY3j0FeIO0c06VRWjyZqJ8j56rrKVXWZw="
									"cue export data.yaml":                                      "kapicxFFI6eVUFgsIDTc15nVOhWwS8r4A3dCJucFfr8="
									"cue export yaml: some.yaml.data":                           "rKLAtC2ijXrotqk3xPlMryWMpjW06yJ8CuNCWQ8hS4M="
									"cue export .:one .:two .:three":                            "oocGEd5rgqWmLVobhiiCcI7n4YIzqBC1XQ0ZPLxGeaU="
									"cue export package + package file + data + packageless":    "1ks3fzTK/Czhd45OCPuv2SRNyNBwLD1QHM4a93Sny5Y="
									"package file + data":                                       "+ljD3mpQk6YgsXzqa2SnOFitnNUT1hDn+Yw956vzeyE="
									"cue export package + 2x package file + data + packageless": "n18/fKNIKkUBvfWSCzOI0x3tAsrYOyS/mT+K6VImRT0="
									"data file inputs":                                          "oaK7XT7zDNC4hSPZtDB52pSBSAqs6ygXV7a/bJ7RRWk="
									"data file inputs failure":                                  "m30KZ6P6tsF2/N+GNYQObZ8p+GNwfsaa7yjk7fkNlfI="
									"constraint file validating data":                           "xPQP7pPbQT3NDFu6cWob5fyHgTMPp6OuLTsXzF0cz4s="
									"constraint file exported as data":                          "hCcPz1ig8goaI1XsHQwGmmmBy+XOlKdtTGX4B9V0cpI="
									"-l static single":                                          "/gYj7PQhbyljrG2IDnPXumYCZit2/jP0kComtE7mkxQ="
									"-l static multiple":                                        "xSsLCru976E47BW7q0mN3bb19b2aoDkQUjQvUBuarDY="
									"-l static multiple files":                                  "uMb96WFuOUveNKgoNjrCzvZWi851d9u0kfR0pwwJbHg="
									"-l dynamic single":                                         "oaQ+NEPrpBJWmnfJTEGR+gk5oTaVfQhHtUmFRJMkYcI="
									"-l dynamic single with function":                           "PEicOfUHR6bCbg9gIvKmYgroZkTMw/HI7CrsHZw6V4U="
									"-l dynamic --with-context":                                 "36K9zQJQXutYjkSoA+hCmtgeJ13cfBiMf/tdMsEqSKs="
									"multi-doc merge":                                           "LPfi03J+SWlfzvcZy3cBAwddICOsB7kZSdmsB5ETjVI="
									"multi-doc list":                                            "ig6Jnuba8VmNB9ssGMHp8rWfQwkDz+vx5sash6WyBIU="
								}
								upload: {
									"stdin data": "RgxCOjJvmV+bqV5rXZ1ZbI0G+maNGb6iSy6Ac5NqdY4="
								}
								multi_step: {
									hash:       "KGEEM7AP5U04KRC398EN673GHO0926MNGMF33BVQ5LJR1TT01K1G===="
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
