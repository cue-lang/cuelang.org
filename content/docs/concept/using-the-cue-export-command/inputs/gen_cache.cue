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
									"cue export # package x1":         "Hlb6D5DxwBi3ouPdbc8vFl/I9aAd/y7VF6P1R/M7Puk="
									"! cue export # package x2":       "00N/BNfKgWlaZszEyqW9y1e1OEWyFOkfDNzPZlAI7hY="
									"cue export .:one":                "Qu7E6RyHnpIv68WpHllBpXsNN55HhKLXUjIyHTfiSKo="
									"cue export data.yaml":            "6HCbq6+fsmH5lbXi0oDnfnFBBbCD5SxQljyDmSTdfxQ="
									"cue export yaml: some.yaml.data": "MH6D/6vJxCHxhsA8iu04DtdqFoJkMEo44OAJvMsVkqY="
									"cue export .:one .:two .:three":  "+4Gkfr3PDJOztXs70Z9cSOhJMb0H5oRaoqKMokeaIi0="
									"cue export FIXME":                "6AlcWtpqfdHf03/xs4Y3KYNEFt0Wx4SgyLiwscl8IxU="
								}
								upload: {
									"test cue package inputs prose": "mlzhEMwks6VC4g3ABP2glOFKWIoD3HDw72yB+r1o8Rc="
								}
								multi_step: {
									hash:       "RFQ19IHLSE04UU3LC5CD0SJPHJOGCLB5P8Q1UDB9OJFG7QL085Q0===="
									scriptHash: "PCG3S5TPH3SLV3G5FGO18V41O69N5NJ1JKNT6LUQULUTTPRAA410===="
									steps: [{
										doc:      "# \"A *CUE package* input can either be combined with other *CUE package* inputs,\""
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
												# "A *CUE package* input cannot be combined with other *CUE package* inputs
												# **and** other types of input."
												"""
										cmd:      "cue export .:A .:B data.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B pacakgeB.cue"
										exitCode: 1
										output: """
												could not find file /home/runner/pacakgeB.cue: stat: stat /home/runner/pacakgeB.cue: no such file or directory

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
										cmd:      "rm *.cue data.yml schema.json"
										exitCode: 0
										output:   ""
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
