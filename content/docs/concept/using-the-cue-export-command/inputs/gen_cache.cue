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
									"cue export # package x1":                                   "XIAtCCtCNED9P0LL3CA26e9k3Hl+9h+/tD2f3XabAp8="
									"! cue export # package x2":                                 "I7a0+UdhLXO5Mdjp5SWI302oWlUtdOTWc8b2TK1Khsc="
									"cue export . # package x1":                                 "SQMNIGIJWEaQK72LKMatcaD+bYc9r19HHnR9RMPBdUc="
									"cue export .:one":                                          "QmhKYNur954ED6JWw0WH3O9SXs9RUbLsAbEPT4mxJz4="
									"cue export data.yaml":                                      "XycSYbd1p3Iy4LD9MuRDypnG4fFKTNTvpcdWGNKpiAo="
									"cue export yaml: some.yaml.data":                           "aGoLXAntojqH5qNyaW0jwfY3nRqtTkhNgIM9c8CoveQ="
									"cue export .:one .:two .:three":                            "ErC1PhqSv4VQw6JOLwzbUCoyeJbqmINoGQczf8eWCRk="
									"cue export package + package file + data + packageless":    "QCsgCa+K96iGu/cjGToIfsJsf2Cmw8AFWw8+/lQ355w="
									"package file + data":                                       "39YTpd4yzW9hNazweBvObOloiRamq8MCCCIjWXQPeX0="
									"cue export package + 2x package file + data + packageless": "BSWon95BkdFFz6221daNK0ya3lo1XnUu0GQLDU6bnxQ="
									"data file inputs":                                          "WDRUfD2YaZtbduh0HNbD55bSRpoAH8TfbjyUD7pRNrs="
									"data file inputs failure":                                  "UAtAp1ETKWxkD5egD+H2ztd2eWXlFfo1YJsQ0d0YBAM="
									"constraint file validating data":                           "/lOP+vJJS3NQy9l0ZHHJ3L2nTA9XQdkujXXJbJlqE/Y="
									"constraint file exported as data":                          "ALNJbmqM5jelQoQwof9sLnKkeSbbu+Uq91w9ShtOfhM="
									"-l static single":                                          "Bp3nJX6eXPy9StB9OtQRmFRhyuO14r3yrbz73NetJO8="
									"-l static multiple":                                        "zhAyfeU1im7N1Unlfp9Ipr9rM2lX1LOeFtx+8OH8bMo="
									"-l static multiple files":                                  "yVKoQ/T5HTSzA9eS9Ng2ou28708o/4H7lrtQhzMBkIs="
									"-l dynamic single":                                         "bLZXuelFL8HJtuKY7I5gF7qCbxdr6LkRooXDTz09Ut0="
									"-l dynamic single with function":                           "MBn1ESvbxDiWAdmlZCqYi80hWxaDYIXQGj2HyY59DVE="
									"-l dynamic --with-context":                                 "4JlIWbw6+JC+zhjKuPKFgOQEQOL3/wU8VCI0MHjpRsc="
									"multi-doc merge":                                           "QProYuMbO6ZzdaEaPrI668x2DEJmaNzZZmnUMHTw95Q="
									"multi-doc list":                                            "okExGwxw/oNVIcE0P9H8/GQLFoZcoT93vV43DjguGjI="
								}
								upload: {
									"stdin data": "zeTAFav6/y1S65zaQ29OAr/RhuzAI2weGgoKMmI7948="
								}
								multi_step: {
									hash:       "R0776ES0UNFA3116TTPN63GOGQQ74UP43IGPGI4UP4ASDKO3S18G===="
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
