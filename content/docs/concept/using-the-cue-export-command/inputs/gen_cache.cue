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
									"cue export # package x1":                                   "EeNmy5rrvQqVmGDhVH5v1NFvWI8tscr8ZmtaQdjslGs="
									"! cue export # package x2":                                 "pHM9tsUklLQGdQbONUjgOA50PyD4GE222N8i/b5HkWg="
									"cue export . # package x1":                                 "aDtwIMybqh59EmbRFKe6uVEi7NfmL7rrb5XYRi47mBw="
									"cue export .:one":                                          "2jYyUW9ZMmVU27L11zXJ7S7GYFFxU/1vZ9cWsY+ddHY="
									"cue export data.yaml":                                      "HST4ERtaJDZdhsWPnwFaKsJosCjbBFVefP1EVuChXVg="
									"cue export yaml: some.yaml.data":                           "0rc4KfEo0ChMSH2/3HL2ft50oei+CMJYjLEMiYVrf0w="
									"cue export .:one .:two .:three":                            "M0uNPNi/LY3q50Szu2CjEVVHWiRujRHl90K0/dzahoo="
									"cue export package + package file + data + packageless":    "/gbn6zZMA1zmdd5C0IOt4cUwOmK6X4h3pcS73mW+8I8="
									"package file + data":                                       "MUlcnQQS6gRXUCFldyRbkB1TSiivTRNuyOKqDKgrphQ="
									"cue export package + 2x package file + data + packageless": "TobHIT82JRuo/ZIvT4ggm5xDIqhHOXOhANbr0vVB2OA="
									"data file inputs":                                          "NH6rA2vQWe0IMuW3itJYczLU/rIXUNGBqc7a8QfJEDs="
									"data file inputs failure":                                  "6sdHiuwkcYYD0gouBLSK1mnd1ggPEpjo/BQG9RKWsfM="
									"constraint file validating data":                           "IUXtyPIzI/BEILeUPF/Srks7zx2OuFN9NOorw/CPt3o="
									"constraint file exported as data":                          "dubi8e6Ny1Me0mqb2ClVrZR1rkjy+eTkc6nrXxlY4hE="
									"-l static single":                                          "gDWYvMDDAKZgBvxzFRRnq6JoN/4ZMQ7l1QwdGKc73CY="
									"-l static multiple":                                        "Jpjj68tnT7lZNsaRDacihaySi4csqHU8x6EgoO8HpIs="
									"-l static multiple files":                                  "m+LVxsJQUy9gfWxKi/OsO46gcfvjTwX7m7D8Sds4wAI="
									"-l dynamic single":                                         "F6+IcyvGR1orKBhFsQZSRnYGytOXGMsxsHG38nQGO74="
									"-l dynamic single with function":                           "gqsNWZd2dV68HiigXunnegIJ4Q7Iim4pwPM3nUF3pLQ="
									"-l dynamic --with-context":                                 "/jn8haa56s2wnlSzm7v46hAGH/nxSkzXprL3sZnlt1I="
									"multi-doc merge":                                           "dvR8iVC3JJaq5SQ4RXqlopMXDmOLQs30MxMuIVrx+F8="
									"multi-doc list":                                            "JIGCv5rHf5kP5jxup0kyPH5skQ37ghQiw0KbYoEVDkQ="
								}
								upload: {
									"test cue package inputs prose":              "Ibz1qt8BsNwi0vUl5bW0POj6E3OICNW+ikJAzXpizDk="
									"test multiple cue package inputs prose":     "na9MMZ6CUYM0znBBPEStRwqaszQBCEsJku9egapbAFI="
									"test cue package + other input types prose": "JD2lXGCTWbBstnzPxE0VWkjTHqjn9sJ41WNuCk3ceEU="
									"stdin data":                                 "aqqdtUOKMyscFl24F+TtZ3jpNT45VS1rxa4g/AvyNEM="
								}
								multi_step: {
									hash:       "Q659POBHBPHD5IIACJ04E3B41KM9LQ8GGNG3GI4IDLIO0SKVP8GG===="
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
