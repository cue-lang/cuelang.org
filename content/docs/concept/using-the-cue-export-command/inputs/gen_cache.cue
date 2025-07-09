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
									"cue export # package x1":                                   "k1zY/KrhsviDAmGHS3hANH2gx4SH9PmDwpANXqtJtg8="
									"! cue export # package x2":                                 "7pa4pQsVad3dcM/iD1sEw1MePvm/mERxojutMaaXdiY="
									"cue export . # package x1":                                 "1QPHgsoz7RzMcrg/7aTKQBBVr4cUftRgPUYuPu4ylsM="
									"cue export .:one":                                          "Bt0s4YjZbzOKVWsVs6+Qw0xPSPb+IgsPZi36LvRNc1Y="
									"cue export data.yaml":                                      "M3Yo5j5wsZ3srSBfaOSJHvIDm3S7ApqCnqNvTpgqDEk="
									"cue export yaml: some.yaml.data":                           "p88pVQMQJ750rD74hU/dJZc2S3mfZEfJTQn98QmZ3hw="
									"cue export .:one .:two .:three":                            "3W6RyxYE5HMd+f7M0KwSRNwk9he9kCyrvDPoboMpqWY="
									"cue export package + package file + data + packageless":    "ViNsOqR+gpA6q9UOtuMxxOqu/L64/fcemwjX1JQV/Ic="
									"package file + data":                                       "sOw0LQ3sB8OLz3/DUAxhhIVl9BDtr1fIJyPMbsPUI58="
									"cue export package + 2x package file + data + packageless": "dJVdFQSJuN9shGDh/weu/cvo3aV2bmz4cyWCpxLtDxQ="
									"data file inputs":                                          "+pJXJ4Vj+Jv3ba1f2+Od+mznsX2LfHq1WB+eDxO2caA="
									"data file inputs failure":                                  "lYH8mZFwn2hUqmXIWKSsjMglhv3ZQVXK1U0NdGKnoos="
									"constraint file validating data":                           "TjxM2RSN+vr0QIDHg82CLktOXqbyd4dg9mZMbZ/l3cc="
									"constraint file exported as data":                          "9KnTg6UxdgNsdK8BS88JnC1LKBOReD4DXKhMBHfq6lQ="
									"-l static single":                                          "m3ebHxw15N9cc+Jq99jtEUco7XysL6lEUiUxrxQSTUQ="
									"-l static multiple":                                        "iOW7/t6guYdUECuZw65ecDSmsF2FJHGwOR5CIIZ/Hr8="
									"-l static multiple files":                                  "2IXjfUShQc/qYgp5j2F0rNk0JTi4+HsR94A4wgJsqWg="
									"-l dynamic single":                                         "xZL3OfyeMHxNcFhnkZTeX5TAyqzA1hT+jUK+PRNwMXA="
									"-l dynamic single with function":                           "UxiGgLCZjCv1ZjAZPT2k5VHJb9Mqnswe6nY2IlaRZ7I="
									"-l dynamic --with-context":                                 "nlGqQguQYNQpYuF0NgniwwIxpcPmmfPHozefjQNdbvc="
									"multi-doc merge":                                           "AU8vb1XmhLDTtNMTjn1VjlrX9ZqWyadvFhNy6/s3u6s="
									"multi-doc list":                                            "vGYkw8S/MmYrVm7LmdtXe47cxKdcSiitDtCISiptL5U="
								}
								upload: {
									"test cue package inputs prose":              "FQW4T5e8h1JqIeEH3VgaPd2Ll5E81nuTz9dNGU6cXQw="
									"test multiple cue package inputs prose":     "/RhdVekm0/NrqKqdAy2SNxH87Zoi/nlUP8DPntQ+frk="
									"test cue package + other input types prose": "Nn1pGFwqPc3+lNQMLTOxA+Elf4uZLqeY8cTHylYnMlM="
									"stdin data":                                 "3mk1PJKcpYIxia8ItPCRH9kgjRzB2Exd3qpFEJbcrTo="
								}
								multi_step: {
									hash:       "PM3GUKR0AO5AQI1OH0ASOQENJGBVQ876SQKM9V8K98E3L9KEVRUG===="
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
