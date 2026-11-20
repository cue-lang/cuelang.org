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
									"cue export # package x1":                                   "MaFbF5HiHXjbEPyOvSMygJY7q7g7T/zLbM44eqmj5uQ="
									"! cue export # package x2":                                 "YwZ1ujxFfe3kJl7pssz8FtpD+G0jaDoJieM55WqX888="
									"cue export . # package x1":                                 "bUa9/+LSq0qcWO7E8QmPFK30Li9FoTttbwBWvJZZ5Rg="
									"cue export .:one":                                          "TygAlhUawEBrVAe+59swwTRmQvRl54bOa3CQXqihtjQ="
									"cue export data.yaml":                                      "ycWwLv+pv/W0whSBuZ9icovwo9RPKRkDxDK787yb5kw="
									"cue export yaml: some.yaml.data":                           "s5XCtWUTZzZsnRboowZFjQny9MmJ8QQ0LjtU6uOoKsc="
									"cue export .:one .:two .:three":                            "EMQhKlmd9C9x4La0gX++lap16epcyoZvTscE9OCUVoA="
									"cue export package + package file + data + packageless":    "WfpDKepkW0K4lrQBofkoVUHzxafpNwRuyJww5MTOUqo="
									"package file + data":                                       "JU7BMHdxvSyxLwayuv5TKnp+NJdSfot31JlpXRbaAFc="
									"cue export package + 2x package file + data + packageless": "lkFAUmf5yf5rInSADcMyFl4n7UzcQC7LxwC/yZo2xEA="
									"data file inputs":                                          "az/gs581R0jpQaVMHGdV7i8/Ro1kQ0D84U9LETUI7j8="
									"data file inputs failure":                                  "+Kpmj88LueDvX9vG3D0KzyV5iArq24bAabL+bVnXloE="
									"constraint file validating data":                           "zgT1AeoBmlk4XBjR4edzulb3abBHY+okeACXATpcqZ0="
									"constraint file exported as data":                          "lj2sAi/qs+o1hRuKdT0m5G8i4CCF2i5eWMkYqgD7Gjw="
									"-l static single":                                          "WcF+YAg7vGgr3MeGZ1qAqSA9f34dHuNNLdNN5fkoXDU="
									"-l static multiple":                                        "pD/s/icGxeedG20ekFO+8EyXukfC2FKy2te9zRFWphk="
									"-l static multiple files":                                  "Eix5TsU45jddh1jSUi4irFGQA50bxMnJZq6qmhd/bYI="
									"-l dynamic single":                                         "TiIO79WFSdgHLFs12XGKsTJxD80Doc6EvvVFSSMoK8E="
									"-l dynamic single with function":                           "5MYLVCkB8bl0I8Tuy+BKsuyooUHErB81T3mUAwK4XX8="
									"-l dynamic --with-context":                                 "8EYHilMrPKY1ZppRsZfBzMjv6glxCyNqY0+hrjEwv4s="
									"multi-doc merge":                                           "SbqNfvy9j9dkRzgDlTGIF+HDz7hf26UjrUdPbhh2/IY="
									"multi-doc list":                                            "riMRKJXg5sT888ldNZ1r5e14dooP6/mvGHq/O7/CWJM="
								}
								upload: {
									"stdin data": "jfjaz6jlSVkUhh+iFBSEEEMJrfHf19iC2DmQunSvnwA="
								}
								multi_step: {
									hash:       "SMSDQ84AQGHNFRVR8TCS08T41R9LFEPREIJQ49DC7E1O301FS4F0===="
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
