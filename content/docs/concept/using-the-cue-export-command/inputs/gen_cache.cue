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
									"cue export # package x1":                                   "3FtlYMgn1ZaYNll1POVmcOwn5P2S0tiThsx9JMsPavo="
									"! cue export # package x2":                                 "u9NO8spYGP7m5KbUmEq5urcsEDQ27rsKDNY8FBMaJzQ="
									"cue export . # package x1":                                 "NAg36tn39j0LNOSl6BpLnuxZb96FrYyUbC1ygpF1byo="
									"cue export .:one":                                          "idoige0/yLSdb7blUUhV02xDYZBecQmFaHQWkduBPSM="
									"cue export data.yaml":                                      "hgz8m2uWQeYfa+1xsqEkpDpSIE3REMufBxPNz5g1MNY="
									"cue export yaml: some.yaml.data":                           "gjmsdsIvwgOYBe39LjGyzj8e/lxuwS6xQ63PCmhymNU="
									"cue export .:one .:two .:three":                            "6wQNgfq0zjL/NIHljRtP8vbAonA69REohqc9fC7eI90="
									"cue export package + package file + data + packageless":    "RH78hENbWwJrz6OMGDN/PGybHZuYNoZ1V0DT/r5V4xs="
									"package file + data":                                       "bpeFNG2n/Ky6iQpEQw+FkUkuw1xr994k+iuyhmjQ2sg="
									"cue export package + 2x package file + data + packageless": "+wk9WJxSprm8sbe8NeVzgGHjNZYGyVK6ogG9t0BMDbQ="
									"data file inputs":                                          "Ki3lLkwIPbwrQnPLwFKZ/20qhCAbqFRDBVKHes+hwB8="
									"data file inputs failure":                                  "njYug2JvC1DbtNKwkCLVH9wu+68YowuO7VqpTPk8neE="
									"constraint file validating data":                           "uHmnW05F2XNqaJoy+RfZBfEGv3duod5c9/bUcwUqKAI="
									"constraint file exported as data":                          "ZASE+GuU7GQYQzmk8mskzpgtHdSf/oH8BWUo/6aADjw="
									"-l static single":                                          "Wr/nDPXUTeIqtx9YHEOb8a4qaFs4uHF53toJhzreNwE="
									"-l static multiple":                                        "7rXhOaxw+tevrqc7pFDmBQFAYyI4tO0Al9fO75FQfgg="
									"-l static multiple files":                                  "9TGr7zPb3B11GXyg3LgFpxpkTbWTHD2uc9LnhH2woig="
									"-l dynamic single":                                         "HOMIvJ0buu5POp2YLtqNrVTkifvtmsPEHwCL7Zwy/eQ="
									"-l dynamic single with function":                           "7pH916IbSikf9ZBNYobey70g9gNv3bvNRXqeQNg4C0c="
									"-l dynamic --with-context":                                 "4o5RVxqgDrPfjT06TirSs3OiBlNYoJG3aHqqTtnhV94="
									"multi-doc merge":                                           "q4l9h5bB27bUUYVc0rX4zWIGp5o3T62oOl13XA+w/tw="
									"multi-doc list":                                            "/8/SIBNmkI+1UNucklK3ydpRDzZ2XONuPxypWt/8gHU="
								}
								upload: {
									"test cue package inputs prose":              "CkGiFd/+Xd42IIDEF7gfgSYld68+0q2OXo5JKj7uSbY="
									"test multiple cue package inputs prose":     "HFSiyDWMtecJNgbsFxhVt80T6FPccuDGSOlbe/mV79w="
									"test cue package + other input types prose": "bGWgYMnEWzdvGDFtPVpYAE/YtTMyvDuGrsJIo3dLPfA="
									"stdin data":                                 "0YLurCvuJ9s/HB3iBWdAv2HpOnt2/qMiuVrbBtPuk6o="
								}
								multi_step: {
									hash:       "QL26MI1MMHK70HG80O53JUPVH034URSRL4QQCBN8PA1T89IHDP3G===="
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
