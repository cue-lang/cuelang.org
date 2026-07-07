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
									"cue export # package x1":                                   "KyN5XWvooZ8ylh4nWRkXO5q6XM0do6Z+Moy7plmjNvw="
									"! cue export # package x2":                                 "XKo/Lp4DpvuZzmAXXtd511/B/spzaJvGbxNjSSEdPz4="
									"cue export . # package x1":                                 "k4Pm3uOrGn3dL1+Qkaun18e+nH7fPSvXoSxzcOwOtzQ="
									"cue export .:one":                                          "3XxTI+uc/jRbVvDvf2TGCvw0BhxikYwprzXToCCvytY="
									"cue export data.yaml":                                      "SlVXXL8GwBptOxMvXUcK+p4zuE50uadsi5StSIUuTA4="
									"cue export yaml: some.yaml.data":                           "edNRRrJ8D/fvOThpf4e5f6rmpOG0kjXsQ0TrXNBjFbE="
									"cue export .:one .:two .:three":                            "3RvjX3YlgXLb+yqRYosy8B2V6j4WetGjruE6qdlzh1I="
									"cue export package + package file + data + packageless":    "cXom3vdXNRAMrweluCmRYqiWfnXLXF3n1SHw0+YuxJc="
									"package file + data":                                       "td2AhFrY9uSkGUbcBBZcVRfZq9Ri2xGMIH6hLp74F88="
									"cue export package + 2x package file + data + packageless": "q7u6uXr055e5/hJNLYDe5aBscVHT8GwQiWtrY/ZE0rk="
									"data file inputs":                                          "vdNpNhawQ8AyWWfvp6N7/P9+v2tgkyimC/p73Pewdv0="
									"data file inputs failure":                                  "bVVwTsSLWdT3jbIsMZag9YXD697/llTwY9+Vp86FoeY="
									"constraint file validating data":                           "Qz6IJCXOXpfpxkdzpS2s6Sv20ATCvVDC2DwT2mAwykQ="
									"constraint file exported as data":                          "tFLLRSSf1T3UFyZMynPx4KkYb0JaZkPZ7DZEzgnZ1eA="
									"-l static single":                                          "2HIYo9k22kvaf+748ry0PE6ra+8ZtWtN5xjmCiTxX9k="
									"-l static multiple":                                        "xsLqrFzV72QriUEQF0PR4BvEQtmJxCqJDX2o50R/qUU="
									"-l static multiple files":                                  "KeRuOoY6WMsPQla/bOlAmz81nmJOi6NGUGYyUdfPFxA="
									"-l dynamic single":                                         "ivqVJhp4Ho3qofcF/RMKcRGn+MhD76x6QXA//oPjSvw="
									"-l dynamic single with function":                           "rNCTS+CE+70lDZqrw1S8VaHQQz9IBt/x4BiJqe1n3Jw="
									"-l dynamic --with-context":                                 "qu51DUCiAISzTCxd2frkNeUMJeSbvwWE+pZ7XUhRBCg="
									"multi-doc merge":                                           "fJAUNEvP4ozvrKcQ18MZHVhRM+TJNzZkpUkL0AsO2AM="
									"multi-doc list":                                            "uH6GB3UAQhQRCEzC7gqhiEC3PIEwJYAjjw2MR5yQcto="
								}
								upload: {
									"stdin data": "v8fz2W96jIoei5lFOCIketJtdjJPXHcxHCEstwGnCxk="
								}
								multi_step: {
									hash:       "PH0086RH74LGPKAMTSKMBOCL27OMM4CA0UA903A97Q5HB6PSOFT0===="
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
