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
									"cue export # package x1":                                   "tUTlzcRnMaCd7EW0lQND4yEJaVUPNSytlasL1jA0cVw="
									"! cue export # package x2":                                 "iCF9UwhykJWjx8uCTvKQvSxENikth3B08dnYchJa+YA="
									"cue export . # package x1":                                 "ZcuTBueitEZCZn22JsgHh0rDh3mSu5Tb/rhrNM9ayXU="
									"cue export .:one":                                          "fg8s6KEEIMu9kq77t0MJ28czyjv4QbWSFxQ/xz4kLFU="
									"cue export data.yaml":                                      "kIzjxv8KMGETClwC0MSrBnn22rOioHnnFQ6E47KvajQ="
									"cue export yaml: some.yaml.data":                           "C6NY3ZH4G3jgnIdc1En1IKasnWJ7He53OOSoAv2n/8c="
									"cue export .:one .:two .:three":                            "AyOI0zgtYaHQ/3TP8Kg8U9CdtmgMCwXdNu9/PrMvPV0="
									"cue export package + package file + data + packageless":    "y0zs0xnH7YFQdT0EqBztW11dfK3z3mTENemYg8rQNGE="
									"package file + data":                                       "4sEp2+2ntLOxynOz5AGPEeSSZWHf54mPOPlKj46iBkM="
									"cue export package + 2x package file + data + packageless": "9zEJ0rwlE3VD1+ZiEQ6SnSWn4xQFLEiGRUdckcsSRHM="
									"data file inputs":                                          "smQ+qLuEKfhnl4L0rcEC4h21vo7kWjcaOxOEvGU1I2w="
									"data file inputs failure":                                  "GNeb5ACB8nc8M87J+IiLdkvwSQ4+jQ705t2eaMeAJ1k="
									"constraint file validating data":                           "Anb6cTEkNf+7W//d7NGD9xmy9QcKU/UjXcU0ocb4tR0="
									"constraint file exported as data":                          "G5NcwLPVEV/c5GO79dWPygB40c4W7AfPPUTZ4HqTG5w="
									"-l static single":                                          "ScxjAcwu+F/I0xfqD86azN7r0lkfb/rxsG05+0Rvhzg="
									"-l static multiple":                                        "5xZ2tOFFM7jKwMUmrgQAShZSA30UIBWt9Oa//3/spqs="
									"-l static multiple files":                                  "rm11DPi/cPzrhQyFQnTrBk3/atartA1qtbQeqd+dpak="
									"-l dynamic single":                                         "7qWnobo9ZpPjW4AacsC4Y3cenoLHMKWkuYQVTubnu0I="
									"-l dynamic single with function":                           "j6CVOhlthr3Rtswhgd4H2RjlQPEtPDj5bFHiJw1NMX4="
									"-l dynamic --with-context":                                 "80B+6aP/+wk8m+t+PmXxOSueWs2eCqundyi3fPiwNUY="
									"multi-doc merge":                                           "5nr+/cMl0rahVCxyoJP+lldSMJsW9sY9IVGSKM/46dE="
									"multi-doc list":                                            "S9Ma3kttvi3rir4v7FO5EmN4fqI2bZp3SeA0KPIbja8="
								}
								upload: {
									"test cue package inputs prose":              "afKneKrQikWJM1SN5CHFR2ovcP4u8Ab19Vt8FnfkSLE="
									"test multiple cue package inputs prose":     "AcvpIA/NRacfZ/+YaDd93K4eu7l60L3TTz0pZIiuWiU="
									"test cue package + other input types prose": "fa9w9GceFskIygVt3leg93+MC8nDDZ6zn3cnIO305VM="
									"stdin data":                                 "lI7lMoyTq334y3Q/Q32zGrnRTxwf9eP6aaCOijMpnF4="
								}
								multi_step: {
									hash:       "R7D0BB8MHVT721K1O9CJEOP1MQF81KCI7H7U8MD61347MEBIED60===="
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
