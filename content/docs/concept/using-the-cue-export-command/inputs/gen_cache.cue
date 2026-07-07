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
									"cue export # package x1":                                   "TDDQlX7faUutJl/dobVMr32RxgwL+0uEG9d9TQqpzvs="
									"! cue export # package x2":                                 "jbItmd7zqomeBa1F0vJO6CUUzcbh5tYFPAvOC7e0tM0="
									"cue export . # package x1":                                 "j/a9t82967DNunFvPfp4kZ8sqmwYBLXTShAspdTt9c4="
									"cue export .:one":                                          "KLcATGB2u2whdC3RV/CK5MhEjro7dXqJsqvz2t3kSss="
									"cue export data.yaml":                                      "2xOWuhQvOHIR/9C5rch1tx+EMVjnyyzzK4dP84UyVdg="
									"cue export yaml: some.yaml.data":                           "eJCZ84tvJoaTaI9Lt2LVeiy4CSErI8+rpJzXoozHtcs="
									"cue export .:one .:two .:three":                            "AgC52nW7FQ7wKP2KaPUxzWkzmCUf+/mnEawUWW3RNc8="
									"cue export package + package file + data + packageless":    "jd35b8WB0IBogltb3+oZJJbY9qsTK3jFSsdQIANt4o4="
									"package file + data":                                       "6p1bc7ZTaOYIaIFZa2POFptPQ0tcEEiydUxOozvnOwY="
									"cue export package + 2x package file + data + packageless": "T73cdd1QRX9nvpBKbFKDFKJNptkIiqcp2ayz11Cw+oo="
									"data file inputs":                                          "RuaMkhmNVKIdhmk22d+0lAQ9G2hmqyBuD/XmLLVZ1Rk="
									"data file inputs failure":                                  "xjjGwukVpHBqU0jeFFRXLzhNTRbjSA0E1wkgUEaPRtQ="
									"constraint file validating data":                           "50SHu7PByJYdNMGddwVOzNlw3oNUntMeU6n2RPikI6I="
									"constraint file exported as data":                          "EDHTFcgpier3j4UBpEq6n8uCvlz9vONv20zcvAWpAH0="
									"-l static single":                                          "P2JWWkoqd4aN2t+3k+2/rRkSJ8x66kBmkQatNMkBNrw="
									"-l static multiple":                                        "e7QRvJ1COkY96nm+8hlM41btnf2uJzOFCXQpZHNJfI0="
									"-l static multiple files":                                  "tqIlOujn898TABmfPZhyt3WxvCgV/wwohBzPBgb6TiM="
									"-l dynamic single":                                         "sT8LVn4H5FKIGsp0NNotDqwXbJxNJ/om4dDT1s1LlWc="
									"-l dynamic single with function":                           "tZKfMDcfPB1kCyVk80MApskEm8OrhC5mNxjR5LaN1JM="
									"-l dynamic --with-context":                                 "OjLBQkXa99akotxIndgYt/tmEEpJsvEXK5a5+ZYZ7+s="
									"multi-doc merge":                                           "c358X8hQFDsLyhQ1ihR/fSFvIFi94iEjHOzCIYF1eQg="
									"multi-doc list":                                            "X+pjBViI57E0Ky9T0H/22b6cYWXKcjJD4D/G3b9R1Gc="
								}
								upload: {
									"stdin data": "YH7NNpncoO74jU+NAmJP/aZ2kvChEwRJC546LZr6wO0="
								}
								multi_step: {
									hash:       "661THVMB3IUCSOH52LSVT18E8OM77T2A30P3MNBAG91LN20RR1M0===="
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
