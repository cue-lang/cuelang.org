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
									"cue export # package x1":                                   "Kk0eh3kXwycnNsx+w1b40+6s53hskXlTanz/h9B+gcw="
									"! cue export # package x2":                                 "dTa2g6LM95nbaNAXZLUAYuA532VHLyP6y6Zn6Lli+jw="
									"cue export . # package x1":                                 "NWCyS+yOtwjgwyWxeVVSJeoE4Y57WbMrsAfd6svq2+Y="
									"cue export .:one":                                          "xmnygdHEpnxoesrVjOcbx2GQ4ASlvqTcUN/8SRiphxg="
									"cue export data.yaml":                                      "41LkgOjaKvDgMJjbkNh4t3dbOddNueFwfVVBwAfgbIM="
									"cue export yaml: some.yaml.data":                           "wfV5wCtVOdHHIDWHeurryxpRxTuhx0DZ2D7ZFkt6E3A="
									"cue export .:one .:two .:three":                            "2tp6x/vxNHnWScHBxIqCZz22ymxdvTWPn+OnmHCo7IY="
									"cue export package + package file + data + packageless":    "kAjFDUyUDnD28hVU3CWx5f1owe4JN1P4l6v2CakJ+Ig="
									"package file + data":                                       "oSttbruIB+q5KcQ/ZYWsN+gyjQ7D/f5EsI143c39z00="
									"cue export package + 2x package file + data + packageless": "dJWCpTyVSpc9qBd0UlFTJDjfeoi49SPUG2n/NJ09+Yc="
									"data file inputs":                                          "bUqiQ7Sc6fLVEyLIS8Sw8aA+0UjRFppFLN69P823eyk="
									"data file inputs failure":                                  "fV7Uh1bXVPvp4c1DkpwR53eYEWrpcmJtoKHbqp81VLc="
									"constraint file validating data":                           "sa8Hldo8kSvtuHKT8808rNz36DZkuTabgTaXlwTkrEc="
									"constraint file exported as data":                          "dMZZlyEvXzUT5SIqXgfhqkOL+YaBbRMO6m+yJ7TbA6g="
									"-l static single":                                          "swAZBi+9pFymtfW1T5sPPF3CsFtGXSCBDVQL0FzLIgM="
									"-l static multiple":                                        "Yae3e9+KnaF7MS+BKxr8w+moqNmgLf0KFoVTnMxbFC8="
									"-l static multiple files":                                  "l36tPKEPrk4xrizlrAIbqdXPZv+iL16xUo+Wb2/Bzx0="
									"-l dynamic single":                                         "DxWG4MJk8pwP7OSIsiRB3r7EwPSqs1qTi/amYfEZhnE="
									"-l dynamic single with function":                           "N1+Zz3DcLFyaDcz9TohDBFUlbRo+jvjlMnib2GqumQw="
									"-l dynamic --with-context":                                 "VvhhpxePYJMvmcJ0hBDi1MEaewrMXCL/21AElRH3OlU="
									"multi-doc merge":                                           "m02EOgAKRYw2a9NxZJaxij9l2AwJMNSsu7TEKOaSCns="
									"multi-doc list":                                            "Li5lCK6qXpZDFCaa4fZ+FEsucLT9eHVMQl0i5BryWbo="
								}
								upload: {
									"stdin data": "4nuJ6noGUBekyDfi6iRShDeM9HW0Nku7mwJOwr8NVHI="
								}
								multi_step: {
									hash:       "2I8IA5LQCR5IA0G88QL2NH9VNORR70G2AMIDQ7R8UM7Q4ORU2F60===="
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
