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
									"cue export # package x1":                                   "ZKwl+AoIV1aifQAcKdQI0HFDYbTcB2XNCBoMP/HVsQ8="
									"! cue export # package x2":                                 "vr/8KDLJBFZL5Ae17f6E00K5F6sfTm1YZotCdCeJ7e0="
									"cue export . # package x1":                                 "uWINTl083E8WryQcSkOfskifRZbH4k1gBum3Mg25CjY="
									"cue export .:one":                                          "zgbOjyD0kajL6fqYNO+wEhIcZHGMBVx8faocS+fi9S0="
									"cue export data.yaml":                                      "gP+nP0LnpqzrCg6sdL0s/uP0QUBxIsQ5XGvvwegTR/w="
									"cue export yaml: some.yaml.data":                           "zKVx7HiKxEqLYUL6VQsKvdUQjpw4POh2evZJmtlR2G4="
									"cue export .:one .:two .:three":                            "XL+n3hjuOTmNRu8pFq9tgaKZClzel9kWPMgtCXS9y2Q="
									"cue export package + package file + data + packageless":    "ZuWZ8K9ndFYaxuNv0JfdDnM/JBweMbgK6NeUXxHINe0="
									"package file + data":                                       "160c5DlART05AbIDXOTPl2pwrlgMRNfUibqYWKuvgwI="
									"cue export package + 2x package file + data + packageless": "naBizKmd85sqP56z1kMJo1FOK0v/SmP5hS85wtkpm6M="
									"data file inputs":                                          "kNOMXOspGYu5o515rJ3xuGxYhmLT4gTv5Vwe9thgIx8="
									"data file inputs failure":                                  "tyzTh5fZWB1KxEdx6OT+kIi1sMQKt0P2hZsQMZYV2BQ="
									"constraint file validating data":                           "cZI7J3NF+Fof1QWh0UzK2dCLVeXFnDwH12QO0V9UI+E="
									"constraint file exported as data":                          "5JwbIEzYswRA0koWOovCEGzbabG7TQI1RNha2WLGfDE="
									"-l static single":                                          "WecwgRyAbB3tZ5dWG9OZbzY+aiDKGW+4LUZnkCya800="
									"-l static multiple":                                        "eK44UaRAkQBcdX8ClGNWlKYX7sdkduzqbakY33K8Pl8="
									"-l static multiple files":                                  "bhH/YhcR142ZlUfGP6Hx8A92g1X9LMV4eAfD2gfhzss="
									"-l dynamic single":                                         "xzFMHOOOrtJNsSXeCieSPQyBNjYODgpmnSesq1+kbxk="
									"-l dynamic single with function":                           "Qpa9i3Zxc55U4oLc6KCTYC06bstgljhk9oe6K6sngHY="
									"-l dynamic --with-context":                                 "6rRhNOfez5PK1u1/wSW9h023Yvyu1U0nfRCnVTSR1iA="
									"multi-doc merge":                                           "VmKesn6h3FMbrwuoDhuhQnUF410P55deTKUySCvY81Y="
									"multi-doc list":                                            "PxFFEHOlZV+utVAeKl2N399N1QwRc6b3iGxda6RMFI0="
								}
								upload: {
									"stdin data": "epZfFH+UrigUAiH35+jrtehBhEcrAU7TkerNDS5cS3k="
								}
								multi_step: {
									hash:       "APS5KVDTTJERD0M675E4IIDTTCVMRQE4QJUT7KAPI1P80MR70NFG===="
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
