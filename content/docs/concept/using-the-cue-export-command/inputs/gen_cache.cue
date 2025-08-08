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
									"cue export # package x1":                                   "7dvKGQUwvw7wzZ9G4/X5BDLaaw5bsU2YOqBKH9fc2f4="
									"! cue export # package x2":                                 "q/i1LHh6bYBSG9/kIKirQtNYEBN+oqSD8zqqjz6om38="
									"cue export . # package x1":                                 "+fvS3RJuMt3gIb1ArkmnhKO+ua5IbGBFO6RVnuMiMRk="
									"cue export .:one":                                          "1rsM67JwdGp9fM+On02I8hg+0+9KUC57C7W8Yc8PTpU="
									"cue export data.yaml":                                      "cp+lp2WBRYwZIKJvhevOncS5EcblbeLiJpf6svTYg5I="
									"cue export yaml: some.yaml.data":                           "oHI2vjrBfEtqqbSppDdsN3QSyp7k8E0AUzCu50G5kd4="
									"cue export .:one .:two .:three":                            "Sc7/u55bqB5FgwRpQfhYiWpNf8tUyrcJBSKsaK1o/VI="
									"cue export package + package file + data + packageless":    "xZuDBem8+pQp2OZpJWRPcmKYSwpH2jbgPxeuR+ju2i0="
									"package file + data":                                       "vQMLCWuPaLWBKs/sLCJcSYKHFU4JuXL3QT20T724DxM="
									"cue export package + 2x package file + data + packageless": "6ke/dEe43/GkRl+Iwza/mlqeLB55xpDbxQ+4C3U7dtc="
									"data file inputs":                                          "Eeb/kl1xeNk8TvEYuZmkFOGC1gNAw4A7BO2VmH21ql4="
									"data file inputs failure":                                  "Z8dUTd3VgHgbiY12XfC+9C0fnTqTTXZqwImskdEgFHs="
									"constraint file validating data":                           "zux467iFHWsWAEhJMT1TLsoxUmj8fKn2EcwXwZGALP8="
									"constraint file exported as data":                          "eECGRyhuLQ3y+XTP35SjpqWucLt6sBER2LjAZeT/wFE="
									"-l static single":                                          "dW3SJYQfpxP3OOGXS3vscdrgVG+oz9lzPy2xopGX3BU="
									"-l static multiple":                                        "iK/CNAora8kenHviLF0vfDvxp+nAvEaH1eCt6woXElo="
									"-l static multiple files":                                  "+4MSarJzX44LTjTu7a/BJ0wCKoMC7+B7E4yvmogD4Q8="
									"-l dynamic single":                                         "TRPAQKwOhIx6RRJa8tHIX7YNInM1lQI84pk68g5b3T8="
									"-l dynamic single with function":                           "GOVUbNg5uoaZed4PKsvfjBaVNO3DklaTsEL2t6bB/qk="
									"-l dynamic --with-context":                                 "i/4nSh9Pxz+cwVpe1YiN/FzskbxuBg9eO1o9KSW6L04="
									"multi-doc merge":                                           "jGpZfG9iLyF78OLYSBFtBgLvD+IuU2vTTrXBJn6d3UM="
									"multi-doc list":                                            "mYmxmrggetuTIVxDPAKdErR5xX3Wi1WQKysYVphgdKE="
								}
								upload: {
									"test cue package inputs prose":              "oQs6bYO1uPu7oFeQ8OMr9p9PH+2KiI0H54oIKK7yTc4="
									"test multiple cue package inputs prose":     "IRWPCPhz/f1un/tQxGIS/1WbPL2HYT1pIZEG8vt/cYI="
									"test cue package + other input types prose": "0QID1RhTh2UFCzY9fRSve36hppFvnsaqDedVCwZ0EBA="
									"stdin data":                                 "L2X10YK+c789rtrT43looGrE7B9HRtS/+BJ8H4VHREs="
								}
								multi_step: {
									hash:       "P866UD7STUV202K96DQ0H45A6MVNBM3782IOML3BM7PM6Q766PJ0===="
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
