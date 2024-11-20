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
									"cue export # package x1":                                   "BhreWhmdAV/rOqkB1LFrl6VTOUvqb46XaerXqxXLMcc="
									"! cue export # package x2":                                 "lSpVLnC5OpviYJZYPj4p/m/mj9McshKI5tjfqYV4gC4="
									"cue export . # package x1":                                 "rTgKp8x9PIdATDsGCrublwrvBZoZCjKowvHTKjRtq9o="
									"cue export .:one":                                          "rdrtGCSZjLs9A7/qRge7l4QmnpxHri+N//G1AI2HYrs="
									"cue export data.yaml":                                      "zD73bBslZ+S5kh77vhl7pNAffAgfa1z1a7O0aaDuPo0="
									"cue export yaml: some.yaml.data":                           "wRQX5FA3yMqYQURc04P1CJLieGuhwETEuEwERaE1jw0="
									"cue export .:one .:two .:three":                            "Pjf+Dto1SzNkp9nkqhSOuExIY/C8R+vaHCZxI7iO3o4="
									"cue export package + package file + data + packageless":    "+Ta7KcuuFJ2W/VGLef1T/r9weRj2rS+3PDlDudrQU/Q="
									"package file + data":                                       "Yjt7YONq5rpvhzwZD6vpGsqIh89bQj3hr3sjmW2tzIM="
									"cue export package + 2x package file + data + packageless": "6lxKhkPuObAbl6q0EvEWMfh+KAu1YZssUL6JpZEvBAA="
									"data file inputs":                                          "ApjESgGWaSkJV7sZFwIUTYjq9JwTeAdx2alQ7p11+68="
									"data file inputs failure":                                  "mEfN/kejThu5hw6HLYgdvEdzZfTf+22CcLaYiZFL49M="
									"constraint file validating data":                           "sBX3umNgtha7jufhvNG0VW2mcGFfoZn9pn97PmqTiqk="
									"constraint file exported as data":                          "MuNlGRoYTDAnfI6kZNIAepINC7aH35mkcawNNlKxRI4="
									"-l static single":                                          "jttv+pkIYofzInK5PbR01M5ezWTAxtcLQu2zLRDKrCE="
									"-l static multiple":                                        "4l6shbpjDNOyzoQMej+VZp94D+01U4HF9XgBOTvgHGc="
									"-l static multiple files":                                  "uR2yjNc2byvWD5TrTFidR6VR71kqk8BLV/ESRQaeY/0="
									"-l dynamic single":                                         "Gc9zM//U9ebMAR7sb/DZ97URghoK1IILg5sd9fETChc="
									"-l dynamic single with function":                           "ENSoVFrPlnfSgeyp61nc309pcpYk++EHQf4HitvFmG4="
									"-l dynamic --with-context":                                 "CTLZkKo8tH5F2wzatxURjj1WmzWUIqIv3rC00ZtJPfA="
									"multi-doc merge":                                           "m5m2KT45m4RRRKMy2MQHBqtnjt01DimLwLvl/xZmRnc="
									"multi-doc list":                                            "RWE+1B+kvhXeqq/6ZRWMdDFEjQ5zn0yG3HyLDcdRXyE="
								}
								upload: {
									"test cue package inputs prose":              "VIswR9GPvuGHiQIHB8ro1bNpnxZQfz6+7tpCSFhE1E8="
									"test multiple cue package inputs prose":     "MtqD/0Nyqq22RH4LJSNGUBmr2/jFCtHhdPFeSh+cefM="
									"test cue package + other input types prose": "MQZVEwzsm8NTw4Xbp32USHq+1DYqj2rvrjcqcOEhv3w="
									"stdin data":                                 "z63WGYQNNv71lZIgDxx5dpGuYsmUw0W89czWqNuW3qI="
								}
								multi_step: {
									hash:       "BLG523E97PITMMUQJ5ROVOCV9UDLJIN1R70C46P6JAQ8IL3GMEF0===="
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
												    "y": 2,
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
