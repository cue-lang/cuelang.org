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
									"cue export # package x1":                                   "YJ+jqBvUYvG2aiGiw8SnubYFknR+2P205Y43HQI0mjU="
									"! cue export # package x2":                                 "caXcayI+k8nfOwu2Onm3ZNqjs6OLgN7EFSAsS1spHxo="
									"cue export . # package x1":                                 "ZGCZx1RdKSyiAkHSUIQoOx53eWi9OjyN3kTT0w3n0hQ="
									"cue export .:one":                                          "EXq3BATGxqIP4uDZusvMDLLc5TQbA1a6cSGfZUePh68="
									"cue export data.yaml":                                      "zUUivorGHYuQbHKXCAouWoQuF6iC/7Ktcbx1ccTFgmc="
									"cue export yaml: some.yaml.data":                           "/aza3DH4FrROHlEVAVkxo+EemKB8RDF0007yO8e3Qs0="
									"cue export .:one .:two .:three":                            "ic+qmSOEp1AHUeAOL1OEyJZ+08vZDBlJK95GXAbHXnw="
									"cue export package + package file + data + packageless":    "V390SatOWmpmZxdiKvEhB2QJ0uk5lMIU0WKflD9IS1c="
									"package file + data":                                       "iDGnugMowqmnriZ33WqxVhVkU0vxhF8CgVXjCXMFS8c="
									"cue export package + 2x package file + data + packageless": "NDZ3sn4EeCgAr9tRJNZfPmqs+U/8ntIz3j8TA0f3JvY="
									"data file inputs":                                          "5p2zjt8IwFPOGC5D8cH867gdsPDCHOhhftH5uDGRPoM="
									"data file inputs failure":                                  "zZcE5HeFvEJ3fn50zm2Tmms3zB5SH0sM9YkU8TCTtZQ="
									"constraint file validating data":                           "gLkIrU8PFjoEt5iSOjyY+0aXv0Glr3+aCGkraUBbVrg="
									"constraint file exported as data":                          "JrdIYLNmy7RwvOIeKb+T2Z+hACJp6GCat3WN0k2of1A="
									"-l static single":                                          "CndHOugy68oiKZjD6XZ0xVrgnZhKqQT4kA9S55qEUAQ="
									"-l static multiple":                                        "0ycuPRBuwL+csu1i5q4Lb196K0vnQuglZUNGk0jFRW4="
									"-l static multiple files":                                  "nqksGjfiPHOLpnhN3UO2u0SM8UWBoAzJ5OGp+ziYxG4="
									"-l dynamic single":                                         "nKpVVNd3ar8ZK1fh7GHMGY+SZbyFHIUMwCBzDqsXmJI="
									"-l dynamic single with function":                           "9LcmlNA+FB6S9YvJlCHf8FMThH1flptNpz3UcVDeViY="
									"-l dynamic --with-context":                                 "sOHWhkQWx0WrgfjaTAPlEEnm121xiGT07OhGi4CmsAE="
									"multi-doc merge":                                           "KG/1RZPxXxw50hbP6LQrXdqJXuEpgdP/KaLtac0omzk="
									"multi-doc list":                                            "0RBn+hA0FKx1RwKkBezJahhPU8aeTWXLlyjABDVZEPM="
								}
								upload: {
									"test cue package inputs prose":              "XoxdYBV0eAAsZx9OWp+6mitC5ecT/3em5U88u6OuuF0="
									"test multiple cue package inputs prose":     "tzR4N9nqxbZeFAbLZxB8oEcK8DS8/xD/05G6YugHWLY="
									"test cue package + other input types prose": "eaZpCjE3AYheMIPuI9eDxTVueHC4+NEPBxUwZpa5/bU="
									"stdin data":                                 "PGEEiYKGykk+Mh+jsiEuFG86dO2is+tkhB8dbSLq7E4="
								}
								multi_step: {
									hash:       "M8GNKPJTA5TFUN3M9MNUV7L0G17HHKDL2SBD264037MDGU68RK6G===="
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
												cannot combine scope with file

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
												cannot combine scope with file

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
												cannot combine scope with file

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
