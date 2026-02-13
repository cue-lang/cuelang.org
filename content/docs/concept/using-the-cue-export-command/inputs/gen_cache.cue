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
									"cue export # package x1":                                   "byO/Qgp1hsez5r7fDnM1GXF4MZ0A24+ol3PDr5AvMDc="
									"! cue export # package x2":                                 "Zo+KAyHdSlsXp6ifyDUdfza4UqJzv109xt33rLJv31E="
									"cue export . # package x1":                                 "78dK9N/qvXIAx/cV7uAxhD7Yw7VvQACYRdeYGmoe5BA="
									"cue export .:one":                                          "/5CSyoIpRjcpFFxx9peAeu0ZlJCONHwOzpscz50GMXU="
									"cue export data.yaml":                                      "KCLPvfCcMfCPLh0zj4QYSTtEyLr2mpGLJ1u8NhLZluk="
									"cue export yaml: some.yaml.data":                           "lyBdFpVyn0cZ2gfLZhUl6yGUcTYc8sr8SQksltUwf90="
									"cue export .:one .:two .:three":                            "ha7/YZsTFChOehAJmWmSmRZ9y5EwTVX58OqaIdeFuto="
									"cue export package + package file + data + packageless":    "MBI+BUs97XmagdaOKyDcoFv8WUyaC6vr4PkbPMBsPjc="
									"package file + data":                                       "fh9d29OvE/I3VEkkX3xsOURxmJZ654EU73IwNIRl8JU="
									"cue export package + 2x package file + data + packageless": "aWBpONQMHvPCWPhd7dGN9fm4/ip3JLRw8pcc7bbZ9cs="
									"data file inputs":                                          "Xs5xCgCm/5CXDtoj6ol1lnIEsgjlLVZ95+3dSBkaZkA="
									"data file inputs failure":                                  "KCAyqPrr1UCVfa1kJ7eU5ZntW3JRoS4FSVfFdGiVUM0="
									"constraint file validating data":                           "WkAGlxJe0bRWKlE3po5jdg1ffhmUHFRZRxfgwMoeedI="
									"constraint file exported as data":                          "LpnFhSo5QAw0aEoPCqvllvIO+mFF97wc7P8VuDMP084="
									"-l static single":                                          "3ibXD0lLtGYiEuRCDUFiU/YLPUtjm7A3Bswok5uc2gM="
									"-l static multiple":                                        "84aI4Sqw+0sv6EiMRL1MYCwcYyrjuMRbn4T00MiVdFk="
									"-l static multiple files":                                  "svU4mfsgcTd9meWA8XaZl/g9kMBRVf9E7jedPCch05c="
									"-l dynamic single":                                         "cUKAXntxBPGvXR3SWVjs0Cqt77CiW3af+/NedJpyFtA="
									"-l dynamic single with function":                           "p9R+Aty6mAtmVq+Pxxw/g0mvXKBfhD0JD+xBgj26zHw="
									"-l dynamic --with-context":                                 "tbN3so+tIei7tQD6bPnsRVjffS2yNDKg1DSZkd93zzU="
									"multi-doc merge":                                           "ekZGBYI/tRRQZeCNGalrzp/vW9zfLFiH9oD5pVwIW8Q="
									"multi-doc list":                                            "ofUUIzzJ2uYMkRuhWk+5rSn1GF745xoxft8fEHA8Zoo="
								}
								upload: {
									"test cue package inputs prose":              "Id18ldwLdEPM4vT54KRjVMR1GJ2Q3re6x+xnrBbLW8w="
									"test multiple cue package inputs prose":     "Ye7j5zosmdP+7SoGVBaUTpnJ6gGamMFIqZpS7yL/hbg="
									"test cue package + other input types prose": "VEYJXv27UGON2rxW9PKdkqP4qbbefWzeIyNtCzCLReM="
									"stdin data":                                 "r+wPOkZYOpvBArLMYScmwnLnILq3DwG7KO05P5FLFOE="
								}
								multi_step: {
									hash:       "5KJD0DH2KK9IU2D5UVU7NH3LUK0K7VS9360O7STAHK88BRQVF5E0===="
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
