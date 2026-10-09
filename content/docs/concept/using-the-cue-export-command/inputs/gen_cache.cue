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
									"cue export # package x1":                                   "J3lHUVa8aHdfuCAD9JaMCNQHfqbfoRmUAOUj0M5cwfg="
									"! cue export # package x2":                                 "vUMmpynwF7rh6Ngzf4Y7vwfM0p5YGmYttbqfxAQUkic="
									"cue export . # package x1":                                 "IPo01qzqVa64lbK5Y6NwDc85oqYLP5jkmjEmhAhmaaQ="
									"cue export .:one":                                          "6kdRC8mnil374kyl4l/Yb4osJLvC8QbvS3GXRqADsXI="
									"cue export data.yaml":                                      "OHX6Kfbw+rzn6jG86YmhQ0ESMhy4klNrwCr9Gvq7oUM="
									"cue export yaml: some.yaml.data":                           "mnFSCTmE+Xmw9MDLVFDCRx3kh0VYa1CXed8g3genB8s="
									"cue export .:one .:two .:three":                            "YyQQcMbd5ZiP5ep4H/2ix/X/HhKFNPxbwJNA/OGIU3Q="
									"cue export package + package file + data + packageless":    "5k79CWvMnXvp7R3CFVg7QvfSFyCzi7mPvDnNVkN9Vuo="
									"package file + data":                                       "13zotmoXZB9Yuokhr4O+ts3vnDTcaDdbSerCgRO92Ws="
									"cue export package + 2x package file + data + packageless": "b6aRT+ODYpmgAYC0/nB2cPF3IbSL/ZTXycIpSwT8dmc="
									"data file inputs":                                          "jyitzHRoSTkTlGh1ybWJbUV4yHx9atWIwKPZPsTl9Dk="
									"data file inputs failure":                                  "SrieJZfXwSFq1KJjaiMmJ5+s8fI5lO9mvtpjskqlHAQ="
									"constraint file validating data":                           "9tM9CkruoqYjjWREbZNcyovDFHzNlrWV1Mqwfc63CDw="
									"constraint file exported as data":                          "qZrjMBi9lLFDjqK5pIA4E0Yrf0DRGuU9UJWmx+UT+xw="
									"-l static single":                                          "ub7XVq0jv9DNQlL/1ML4sPkRuxQtEUAsIes8mZlVTZI="
									"-l static multiple":                                        "s061HlueI39AczqvBVVyaGVi3K1K0pwGR6wsOIetXDU="
									"-l static multiple files":                                  "QgS8/gMUs/aeNxW3yzv9nGrfvmrMQCdnk09OO6zvmxQ="
									"-l dynamic single":                                         "sJYwk4Qc2Tzx9p9kr6VJUgJXYto7oJrZtC6ixroLLDw="
									"-l dynamic single with function":                           "FCnzNXkNca9wg5EqwtKo9YRJnGhtQOCnxlYX2rlFY1c="
									"-l dynamic --with-context":                                 "7Vr7Ku/s+GGICES6ky7dRugjpa9AV3rZgds2mr6HARk="
									"multi-doc merge":                                           "nhBtKEDSRkB1362rOkEtvrwVQy/gcyPF04FxlXsxaYQ="
									"multi-doc list":                                            "BzGDm3zx7u7TzDRcl1klGJbHPLMoKrXQXSoLfSM3ipo="
								}
								upload: {
									"stdin data": "S9zzVLJcIw46AuadZH4GGGuCSST7LsjSGSdai/4/B3Y="
								}
								multi_step: {
									hash:       "SN92EC8E99Q6I9ABTB0M1JNC72FM1FKIU0NEA256J38M3N83MFQ0===="
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
