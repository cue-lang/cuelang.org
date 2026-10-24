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
									"cue export # package x1":                                   "MeSAQ9/BYzzdeD4UYxDncRGQ9ygq6HF2eeAd0gXg1Us="
									"! cue export # package x2":                                 "+8zllMdY/YPxoblEpGjHJi1wx9O4xeWsEeyJXuYLzG8="
									"cue export . # package x1":                                 "CEhlavqvtnG5C2uDHze+KkahUZQTfE0Zatl0L36+Jvg="
									"cue export .:one":                                          "iG1nSNNok59IwGEBaRELjcdlo+wmNESHzBavGCLyJGI="
									"cue export data.yaml":                                      "OGMQhn0HbbAzms0WLqOgv+eQ52aoYRkCXS232oQNCUU="
									"cue export yaml: some.yaml.data":                           "hqxtg3iS/8XXb8TPCvEltoTzLc9OnnCp/NiHVxBeUf4="
									"cue export .:one .:two .:three":                            "pikEpcue4gxMO5so2wxCb9bCaT6XLDCNAo6ZB4kcyTo="
									"cue export package + package file + data + packageless":    "PXlfpWSxbiI3eQmePxpfoJNqbnfRYPMJ1dG6L1QoDaY="
									"package file + data":                                       "1e3lRcZQuaaMal7WiMOrixcu4k5tbWkkB0B+4dvDJIo="
									"cue export package + 2x package file + data + packageless": "AXyXfaBOe0CBtA0gm+fM2jxlt7f1q6QXzQj5nJP1qHo="
									"data file inputs":                                          "pjhHangiwtxkcGRkesYBVPnrplcJ0QCQYgDdwBXiuRw="
									"data file inputs failure":                                  "G3J6nITt14zcebOU95Pd8lVLu4A9oatwy+p+ee1keT0="
									"constraint file validating data":                           "8raddcz7c0wX8GQFupWqQVNsu0ghT2K+NGBv3OGXIY8="
									"constraint file exported as data":                          "wQEFC3xFeb98VxAdZlDcCqzGXxogO1mTS5EhJcnHo1k="
									"-l static single":                                          "Xrom04oDtzq0mgo0WerFgj/VVKWoD+jPSRCg8lee/Z0="
									"-l static multiple":                                        "lKZXbtqoa/8va+1w3gI84AdlaM2rEUnARCRRlOeHYaE="
									"-l static multiple files":                                  "Dny187lkdNK/kdpeZHbSyBZ8h81ZGgmH7RmTb2VAVPI="
									"-l dynamic single":                                         "Wf6VUnZehdyrlE9Lu+Htgl7dtHx8GAzZaFWbWATZBhI="
									"-l dynamic single with function":                           "l+zqzHlJJ5tYCF3IXb4fsqQVBb/w3BsC6xrP76nQfY0="
									"-l dynamic --with-context":                                 "ectyGWjh8qo+DgocrVfDDYBfcPZ/YpchD70fu5bhnxw="
									"multi-doc merge":                                           "YzYgdr6fpQVLsiuVfw8ncJZOSsROZpzZvIT1Q4+5N3g="
									"multi-doc list":                                            "0pn98ABSBKhQA8p7t2yjpPrshYXY9s6l1ToMhgU3ZPY="
								}
								upload: {
									"stdin data": "ujrQWnROuPvQKKXc4f6uieq8xasV+QXd+wTG3g7m/Q8="
								}
								multi_step: {
									hash:       "HS29SSBFUFUBLRUR3J3PA9K8M98USNUSGITPI1G4QJU124AGMT4G===="
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
