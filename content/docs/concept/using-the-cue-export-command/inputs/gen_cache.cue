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
									"cue export # package x1":                                   "SP3AAOC0hWWOhJ0BUKScx1VCu2OWXVqAA+q0980YnpA="
									"! cue export # package x2":                                 "78QiaioEb06t6LgveZQws1BfRIMcvARAQjKspIjHFbU="
									"cue export . # package x1":                                 "XvHuTe2jyjv8Y64rvs6/aYULUrIhUImwKg89I9kcpVE="
									"cue export .:one":                                          "Pz7hllnNUTKM2Rg1wunVaBTY7ZFHBdzb1fDZAglHf4A="
									"cue export data.yaml":                                      "r22pOKMfWDOxD9PK0EJ+SW9qod4Uj2ecUGAyjpFo04k="
									"cue export yaml: some.yaml.data":                           "+zN4cbyHTufXf379rBvzRkVxoktErQcIwfnZ9QIoJew="
									"cue export .:one .:two .:three":                            "A4Z03i0/6roelWyTEDDF4mwdhq6fYLyxKN2oW319i3s="
									"cue export package + package file + data + packageless":    "FDhVfLlrzdhNXkIL57yD59uwdfsMd2sfSqp3cLqcgm8="
									"package file + data":                                       "L6oXKbvnCH3PF0xqnPs/r2Uv2yF8eHoCVelKuxWXqc0="
									"cue export package + 2x package file + data + packageless": "sPVZlPSs1E18L260kOKjByjiFZ0MgnH+PyqjfQGrvhU="
									"data file inputs":                                          "mqS1lsulpkRkCYhQ1LjHDbc/IS0Eb83V8vZzHipKOio="
									"data file inputs failure":                                  "a3uiUw23OIElVXFnE2evE2Uxa/Io4GT/VVC9irJ0iVo="
									"constraint file validating data":                           "q1pwtbmgDYJ+7gJbuHpZ4EjYaog05BFrzJytb3XqlUE="
									"constraint file exported as data":                          "GKDoVFdivHmzwMdoqQcqQKLEMPtD+jzfqaMhALbMqcg="
									"-l static single":                                          "3whruHiseLujC9yzX/W3tuVAGUV0eBNztgYU8xZWcVc="
									"-l static multiple":                                        "L+uMdO3rnH5JBU3DtCcbZzqAs+msL8kLRqcULxgkDx8="
									"-l static multiple files":                                  "7FeIGAKG13mWHx21SlSGNyT8Q/vEPfcu2dpBqP2jc1U="
									"-l dynamic single":                                         "7DnW5isn7ZgVa4If+QMwcqRX9glMA96RK+OsSdPBUwE="
									"-l dynamic single with function":                           "JdsT+65PFx2y3mBFP7KjqinX/fFZ6VEeWnXmzdHPzy4="
									"-l dynamic --with-context":                                 "YbipX9lK1yRxCgwDPvQZZ57kpupJCjDJlD6bPaikVFY="
									"multi-doc merge":                                           "YLnWyS6e87ToZmHHA5/mUcAnlfx/UJlu0cKWAFxkcn8="
									"multi-doc list":                                            "7wRmSKY15wEAhT13iE32auSy+iaIoT99dEJrIm4De64="
								}
								upload: {
									"stdin data": "YOqM/ae5qpLCWShuGNA0bYlIfyMYORtKffhTEnyIfMw="
								}
								multi_step: {
									hash:       "3AUF7089NTAJI2RPV3KQ0RJ8VDFV0HVH2GTJ9QUGRPHCEO0BJMPG===="
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
