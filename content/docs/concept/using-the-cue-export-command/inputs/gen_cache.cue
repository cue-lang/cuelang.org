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
									"cue export # package x1":                                   "E6zuS8rp5CXnk3dj1adz67j14hlvZ3dLFtT9X1Uc8g0="
									"! cue export # package x2":                                 "yMyjRmpvX5j/wHaqFa9Nz0h4UdHCndJNUXz2DNmIYOw="
									"cue export . # package x1":                                 "BkG032N5QzbFs6SZv/OrEUk/pXHhjajUIARDhym1ocM="
									"cue export .:one":                                          "U70/sBzixfKByD5JdnDzvMSVJHaBy143tOnWAENvzgI="
									"cue export data.yaml":                                      "PA2iQl4u/sterhAQ9w/HrstwAVYHvjc2dsGoiTM9Oao="
									"cue export yaml: some.yaml.data":                           "09zyoTTC9G+AVo9jhxPlr5gMFgcomayzEZhFUw3wGF0="
									"cue export .:one .:two .:three":                            "HcV3kZM2x0TkeE4juaQne2SYE3j7w6YukuWe6lzkFZQ="
									"cue export package + package file + data + packageless":    "4eGy3eHbAst4RlGdXGgMjn2TvRT145kdOelxsgi/4Rg="
									"package file + data":                                       "GYaJoZPfvbrDNsT5/RPs4piGhQS3PIzJoO6phg1VVvA="
									"cue export package + 2x package file + data + packageless": "EsRHAPNVnVLIYpu2d856YWdwxay8fziuw2oEsxcuFzk="
									"data file inputs":                                          "MbLWBJuwpVZMyfUGQW4PBYIiL3naXZk8wv7yMLBrdYM="
									"data file inputs failure":                                  "38WCSsO10dlkJIF5XpYzGUR9P+hWLslpCXnjSIg3UyA="
									"constraint file validating data":                           "lIq7YRtM46+W467sqzeNQa1n638BnlmXOe1c+kOuw6Y="
									"constraint file exported as data":                          "dDn7W3rEWhwWQHn8bBMq+2vSNYQyWlI0VbwRPBl8xAQ="
									"-l static single":                                          "8krRWmYxWdSBFwsp0amSdFu9OUnDwPJ1v3oxYRsZn+k="
									"-l static multiple":                                        "/aTXAM23I711fdVbB2p/ctFwiEZ2wew6v1hF+mh9CKA="
									"-l static multiple files":                                  "U0ogoiHZxRlxch78+OwkKAnsXZzCs/C3G68QRFJ7Pq8="
									"-l dynamic single":                                         "vyOQVFHt/Rq13t02OiIdHfw8oHojsfl7l85JnJvNUp8="
									"-l dynamic single with function":                           "nU6YFAQBiIyi0amDP+mA2EvnznB/HuLM3iD+6SeHwm8="
									"-l dynamic --with-context":                                 "j/f4ShU6DmznhHVbA0UWbFLvfJo9ExUsDhBbo2ygLmE="
									"multi-doc merge":                                           "Z7FeRxW7X5EvPeSMaPhv8NFhz9fkjwWGqeYo2YTmAy4="
									"multi-doc list":                                            "UoOoiQFtBbyq5dQy10O1DK+TUvpNi3qEUSz/SvvAs6M="
								}
								upload: {
									"stdin data": "5ekmHYnqs7tqkRCnB/Z3WzayzCGPp9Mjz0SQx89Nbu0="
								}
								multi_step: {
									hash:       "A0CGG88PQIQEVQNVMF1V7KIUG3KKTSDCFDN0AAHMO7963ATC5KRG===="
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
