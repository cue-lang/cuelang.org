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
									"cue export # package x1":                                   "jdtn3AB8/uwrDmajeZPecWCa7dzk44eWCHANCH5Ar9I="
									"! cue export # package x2":                                 "BEXRo0tn6YhbCrU4Un7IiNa5+6apOgrSKC4rEEoTA9g="
									"cue export . # package x1":                                 "naW7dqLPTO51t8tvW5JMRq5GYsIsb+YfoPtysYRkRAA="
									"cue export .:one":                                          "MGOL1X8nhqWyIXa4NdNMDO6mjau4umAGSS7Twom0g5g="
									"cue export data.yaml":                                      "PCXE08/9RzHSbe6qHMwJQpasoKINLoGbbB0wlqZm9zY="
									"cue export yaml: some.yaml.data":                           "HtsA+Ldob+Cd/itP4dmHAsM54wv0wenspkfnFgY5u/Y="
									"cue export .:one .:two .:three":                            "JSlinb7AYxYE5DC6+WlIaAWZFRmpxoKO41x/4WvEGyw="
									"cue export package + package file + data + packageless":    "iwx8hlyyZ6j6vxSq0wya92m1KTSSVRckDDh3KrEQ6Yc="
									"package file + data":                                       "VNtev57qvQw2gyE9jz22hOi5g7uxbpw4pJ2ZH2pIo3Y="
									"cue export package + 2x package file + data + packageless": "u0jf6xVJxXsm08j/IdMTvvlvXX/MP5mNaeiaKVOvr9g="
									"data file inputs":                                          "a9xB/OgMy/wHJSbYridC8mBHqUjGWQx4qKuEfMhtF2k="
									"data file inputs failure":                                  "7Wg0uVLODEKBLV8pZei8JrLv9/AqjpmWWZFCwMfzfB4="
									"constraint file validating data":                           "ihj6zRRf9EfKcg1EPHs/FaIqkvsZvbbA0Zpz9A79mYI="
									"constraint file exported as data":                          "xyvjlPirbZ5Jzlsk7m3BzWefXClpJ7SSeOARuLrjTFQ="
									"-l static single":                                          "dX7FziX/XBPQWVjZcqxWqhBqVg9hDrPfEP0lu8Nz7aY="
									"-l static multiple":                                        "SiR2RgIespW5ypL0vgbHMNNqlEvZsvhbEwUyVJUrfo8="
									"-l static multiple files":                                  "735mqq8cGICUNv8tiuY08epsRAe1P4kBzpp/6lylL+A="
									"-l dynamic single":                                         "NYS/d4Us5BezQQ9BUYA66E7hR42oF09RfX8aFZaIZoI="
									"-l dynamic single with function":                           "3DJMm9duOLaEqn90tdvGWVhblnG2K2CenGI8kekEhmQ="
									"-l dynamic --with-context":                                 "YD1gQ7WgcgpgMxAwtkVfKPEXU4Zp9Nhtd6xzYQ7k46Q="
									"multi-doc merge":                                           "/MQnMn9LV4GRsbOKitKo/veXT9XksvYWwcf9P21boy0="
									"multi-doc list":                                            "B41x0F5oQPH7/Tt1fi3jO9Azmvgc2JUJMlU6MfAtuxw="
								}
								upload: {
									"test cue package inputs prose":              "bBxNa0FRuKYMthP/8wVhBIMfgX5ZhM/7tYh3T9FCyNU="
									"test multiple cue package inputs prose":     "fXHZlv9btLDyRFpJJycTYnVNjgC1Zs2XTgsdZZn/3eo="
									"test cue package + other input types prose": "/G78ZaFe+x/C4zrquyFoEHjJhuAbguivc4bSOPWNbYk="
									"stdin data":                                 "lYBGmpn/uoUsxa9Y3sBGlDvIcgSwCapv/GvBQhZ9wdM="
								}
								multi_step: {
									hash:       "C3VM274BLVG2J6HOUQV6RDUN9ECNKQ63TJMMLOSUATCK23A65P3G===="
									scriptHash: "89HBMOT8AA8UQ8IK2O3ALTSIC68PN1CPK8P82O16CPN7KV1FOF80===="
									steps: [{
										doc:      "# \"A <u style='text-decoration-style: dotted;'>CUE package</u> input can either be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs,\""
										cmd:      "cue export .:A .:B"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}
												{
												    "y": 2
												}

												"""
									}, {
										doc:      "# \"or with any other types of input.\""
										cmd:      "cue export .:A data.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A schema.json"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc: """
												# "A <u style='text-decoration-style: dotted;'>CUE package</u> input cannot be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs
												# **and** other types of input."
												"""
										cmd:      "cue export .:A .:B data.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B packageB.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B data.yml"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B schema.json"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# "When multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs are specified then the resulting CUE
												# evaluation is executed once for each package."
												"""
										cmd:      "cue export .:one .:two >2-packages.out"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '^{$' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '^}$' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '\"x\":' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc: """
												# "Multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs
												# cannot be combined with any other input types"
												"""
										cmd:      "cue export .:one .:two data.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:one .:two data.yml"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:one .:two schema.json"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# "Issue #3341 tracks a problem when combining a *CUE
												# package* input with a <u style='text-decoration-style: dotted;'>constraint file</u> and some other input types)."
												"""
										cmd:      "cue export .:A schema.json data.yml >3341.out 2>&1"
										exitCode: 1
										output:   ""
									}, {
										doc:      ""
										cmd:      "grep \"cannot combine packages with individual schema files\" 3341.out"
										exitCode: 0
										output: """
												cannot combine packages with individual schema files

												"""
									}, {
										doc: """
												# "The <u style='text-decoration-style: dotted;'>CUE package</u> input must be the first input specified in the list of
												# arguments"
												"""
										cmd:      "cue export .:A data.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export data.cue .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export data.yml .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export packageB.cue .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc: """
												# "If <u style='text-decoration-style: dotted;'>CUE package file</u> inputs are present then their package clauses need to be
												# the same as each other"
												"""
										cmd:      "cue export packageA.cue packageA.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export packageA.cue packageB.cue"
										exitCode: 1
										output: """
												found packages "A" (packageA.cue) and "B" (packageB.cue) in "/home/runner"

												"""
									}, {
										doc: """
												# "but don't need to match the name of any <u style='text-decoration-style: dotted;'>CUE package</u>
												# input that's present."
												"""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
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
