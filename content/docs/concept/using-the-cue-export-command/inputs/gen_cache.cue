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
									"cue export # package x1":                                   "f74hdCEKFxx+PKDW3uNfQ28Jktc1L3i+QegcMivRKX8="
									"! cue export # package x2":                                 "cZYLK2QgfguELxQ0pebUDW8lXlQRyBop1aNeNO3Pvck="
									"cue export . # package x1":                                 "3DWNKhjV8lFI315f7kdthm9O1XO0gD8bgwtDzlL3ZEc="
									"cue export .:one":                                          "sTkwm22iY0r1FocZDWwR1qeSFtKzxqcKvNMktYSRHDM="
									"cue export data.yaml":                                      "ZIC1A4fbBcpUt5PL4yCmmaLZ4eHsdglVmtN1NWUAenE="
									"cue export yaml: some.yaml.data":                           "Z8KR2KIvZgGfQZjffV0jNsweBZTagM2FZ9WyqPB5fQc="
									"cue export .:one .:two .:three":                            "8g4C46mPY7MdgiZ6oTr7/eTp8vDADoNFqS6lvFkIvBQ="
									"cue export package + package file + data + packageless":    "ZqITpYrejSXDYCM3+menyu16eI6S9EQbHWjnB20cr0w="
									"package file + data":                                       "Ji1aGWf2d9UGRaViTzmtkrOuuLq4UhX5QidZ7Rn0CNA="
									"cue export package + 2x package file + data + packageless": "DdRmI/6DiRwhFf07RlLAGq9IRMZF9Fc0DzhfiJLc+qQ="
									"data file inputs":                                          "ZBkLrnwV/7rpbZdN0r+Lbj2wiN2yn0H3XVfukMbUSDw="
									"data file inputs failure":                                  "31msHw0V5LjVz8vvH0rlRXD7ETO1srhL4u6SVXoRas8="
									"constraint file validating data":                           "reKBsd9zW4HMRvqC6ER5flJgLP31T1NkU252yHFfa/8="
									"constraint file exported as data":                          "IHyu34cMTA97JCHbdsLELT5RFOB+3/kj5KzZcNnWxVw="
									"-l static single":                                          "WoVwS6DC5mZJVxiTLmGPlJJJ9kWcAFJv+WTTwnbzBmk="
									"-l static multiple":                                        "toedggQnvi1IpzOGkaWKqZhTUMkntNZt1OJjOzJZ7pI="
									"-l static multiple files":                                  "Nqu/GqzRTOOktQdn2p0/+iq6wa7gJ8D0oNLbKsidf78="
									"-l dynamic single":                                         "vNVpIXA3B72IDbtPNlSkJB+gGYxHPpd0z+bKYY9iPBk="
									"-l dynamic single with function":                           "fqaWUUVELoF6IhrimVB2/zfOACUncWfw62cexni33hk="
									"-l dynamic --with-context":                                 "6jQXVIiPWCgHPOdAUYWsUZBQOsrI0BzRqWO7Npc3O18="
									"multi-doc merge":                                           "jiOEWVpGBVrLy+Z3x43QJEOnJvFkWowoiYmj1uUUrz0="
									"multi-doc list":                                            "0gkdHrUHIeySX4demBu8SoL25dTsE0P37icbDk8zEsY="
								}
								upload: {
									"test cue package inputs prose":              "c82hssj2fgZSuPG00VgvyUxtLjofshR/cZrGySiSMtU="
									"test multiple cue package inputs prose":     "NzLt10b4sZVFlKrMlahkcMESh6BgLJ6cf32+lMla+wA="
									"test cue package + other input types prose": "8LaAtNHbh7DwlRMuJXAjs/3yxKJRWHvZX703TMIgfbw="
									"stdin data":                                 "a8pPnuUtEnsNtUSxO0xsbayVSzgFXaHJTGLEigoaXCI="
								}
								multi_step: {
									hash:       "7UQIFJUEPEV3PL41OS7P5QDU0FCM97K25CLV5SCQGD4LOTQ9ROU0===="
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
