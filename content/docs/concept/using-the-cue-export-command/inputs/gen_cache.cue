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
									"cue export # package x1":                                   "lTPDkpXkiCEsBGOBqP8RvxfT78Te9nOEfNTNlO+AUgA="
									"! cue export # package x2":                                 "RvwG4e39Um7KEmZRqyoLF+et39vBqEyfXe+XMhMNXwk="
									"cue export . # package x1":                                 "97ick7ItwYkZTBMcFWEge2SrZVeIDbf/NMhTjmTF4oA="
									"cue export .:one":                                          "yhgjzvd4XW6IQPgK6pzkNUD5y+7nNTo6vxg/ZHtcvU4="
									"cue export data.yaml":                                      "x/NpAkLDB7d9h9rZIfX8CzV8DqanT4qIJy44q/IDs7Y="
									"cue export yaml: some.yaml.data":                           "UHDPR/R3x7fLKS4PARxU+eMcSWWpRMhccFhn8rk9Hhs="
									"cue export .:one .:two .:three":                            "we9n+vAZLxiMrjTXCWCcmQO9tvwnojALNwTyflHRHDI="
									"cue export package + package file + data + packageless":    "XSFcf4YHBLyia8kbQKuZDKE2o2BjLde8Uq4MQIAAwD0="
									"package file + data":                                       "ZDwELsV7FRJoXikxkwwcpo1ZmPpWR0NxJvxHlgphEXA="
									"cue export package + 2x package file + data + packageless": "47BwO21WmmfIlVlRTbzNUzMMkSt62A7xqze24h8BA7M="
									"data file inputs":                                          "PGArY587Eb0C0kEi1sRyOnuJt8jraui6ngplRL9Ztz0="
									"data file inputs failure":                                  "BGwtWltTJ5c3AVBuPDSnj/F4aUizgsdnUmz14aOVLT8="
									"constraint file validating data":                           "MoRqD3MOWtwHXBu5QQGWlgHm0jUR6WZIHl8mHYfzz50="
									"constraint file exported as data":                          "3nm8WbKcg2oWFjCiKJ/WMct9Ps2P3c5P+Gr8HKvVTbc="
									"-l static single":                                          "6bISXqtHihvVbAHiYGG7TizPu63+IZAxVshbTwVnolg="
									"-l static multiple":                                        "ACyMHc+XruOgOinSplbTDXhuktxE6Imt03IZpnTPMh8="
									"-l static multiple files":                                  "KDxws3o8G34rd1uNk6+LXJJKchXkg2+96wDsOGDFqZg="
									"-l dynamic single":                                         "CBfpKxlPzEJVjdAU5J56cHa0USOG5WYArFN23YCRaHw="
									"-l dynamic single with function":                           "Oh+Kx6N6pbwLnT94VKftVIvATvsDEuHFcBM2t96OLbE="
									"-l dynamic --with-context":                                 "PMgalnXxB0L5E0aBBu6ZV1JzFdTKD623bdkbXAG7uWA="
									"multi-doc merge":                                           "gROuigzPKEuiFAK63ub8P8oJimkK8d8fQZH5B0+LaDQ="
									"multi-doc list":                                            "KPcySaE/xhHMaWLFlbFm/ApizljbEykNkPKcKkhg2iw="
								}
								upload: {
									"test cue package inputs prose":              "W8n7TgkXfKsCs+t8TRXB9EUqJP0IXiHgJM5fD/lpzLE="
									"test multiple cue package inputs prose":     "M0gsufiy/2LNgIyN9FQhCK3FXhpT7p0mjrG4vj6HZlM="
									"test cue package + other input types prose": "+rSMjOZIaPr7FKAt62CR0JEGAuxFCf3EvGB5glOiOFc="
									"stdin data":                                 "TPCpCFwRRNJgvqy9OE1Ug2+6ifZ1YL9/1Y4ZNN9ltJ0="
								}
								multi_step: {
									hash:       "AR2ALK75HVL5CH3UICVOE52B6P5CEJ8RFKSHNLN06S6PG521T8R0===="
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
												found packages "A" (packageA.cue) and "B" (packageB.cue) in "."

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
