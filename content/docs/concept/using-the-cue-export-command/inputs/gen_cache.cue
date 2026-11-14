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
									"cue export # package x1":                                   "1D3PLbLEtCG7qxPBQeQ7UYJxHlmNTasZ4e7oerQWY7M="
									"! cue export # package x2":                                 "Nk6ykzsEUUtj2v0R9ob7qu2DthBwfQa3MJPoa7o4eio="
									"cue export . # package x1":                                 "HCoTj1Ffv3diFKMvQrDqipx9b3Eq3Ol26RpNHGSZIf8="
									"cue export .:one":                                          "DDhfx5yxW+PnSqLN6G+3ZqHkl8fYCBLyWsQMHPjfvQw="
									"cue export data.yaml":                                      "VjlO54WoN5X0KLywqTqYkFOnhs/f32ErKYSR6TpbNwI="
									"cue export yaml: some.yaml.data":                           "ho01ACpaahv2OyPhT5+wjymqzinq320xEfZ155TkSHU="
									"cue export .:one .:two .:three":                            "UsdBfxW/AAAkejKQ8U6daRO1BT+jpqR8Y+WQTQCroXM="
									"cue export package + package file + data + packageless":    "vBW4N4x6CYc8NetnXQLclsrD3iyVT+rqbpCTioUin/8="
									"package file + data":                                       "IhuEs7I/XyQ3XsczUjRkGMyMpoE+rxCnisz948GYAWY="
									"cue export package + 2x package file + data + packageless": "mEI0g8vwL3E0Plu2m5t9hga4v+UvY03bvvM3m/Z07yg="
									"data file inputs":                                          "fEmsz3ZFJqYsnhr8hWbC+XlsukL9DLmiz1Ols14TekA="
									"data file inputs failure":                                  "eK5Feb4AWetb7iK3SgpamXf7DLtzySHDO6K7NBsH8+Y="
									"constraint file validating data":                           "DvdVaSlWMljhqPvTItNSdh6EYMrPugTgm0pe1+zlOtA="
									"constraint file exported as data":                          "KOp0nelRTfG75eqpwuIatuZYBoHNhmGLVq5vNQ8DE00="
									"-l static single":                                          "56u59w78FvtlhGbWJilBpZly6gWKc4j+G1KCTzHPDJw="
									"-l static multiple":                                        "ovUG+THkImrWH8tPC3fWS6r2nKw7F2738TeIhKG+gsY="
									"-l static multiple files":                                  "Qgx1lUYU2nUQ+XM/NXfe8HUsapf1cHtPQ4DnramayTI="
									"-l dynamic single":                                         "lkVk+jqTEttrbK3+/SJnr8vu96m8dnK7d0pWKEenGFo="
									"-l dynamic single with function":                           "xvUR048ToMc8KsxCHBT4sjdsqg8CGZitsR38Gjhlz28="
									"-l dynamic --with-context":                                 "LenH3XuJCkzDsk4fCl2mmtCFzBIgLn0OB8mKDua+JU0="
									"multi-doc merge":                                           "2vuD8/hpE9NbWLQc43NbNL7iRPOZFdzPk9CSYDAW3ww="
									"multi-doc list":                                            "GK3cJs8NlXDj0yAq4LW36vjeyGs6/mRKsgx6lzciv6Y="
								}
								upload: {
									"stdin data": "OMjy0g862xhiPkyDQazxhuhPxoIsa/MrOf3gAOjf9uo="
								}
								multi_step: {
									hash:       "U5U8FACNFECRROU4BAP260MFDB6E4EEDT1G0LP32530NA73VO1F0===="
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
