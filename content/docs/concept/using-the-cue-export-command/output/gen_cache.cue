package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "Kgv+yNVC0eWmzxBIgITP74k4czzoay9LCAs7sHbndl8="
									"stdout yaml":                "JhK2VDZzVH3+l/tWvzIExuWNrzoIjQkNwrgjPevaz80="
									"yaml:-":                     "8RWyDNtdXJ/fq8sJfacN2cijwpk+bCIC1OHhi/UAxTQ="
									"--out cue":                  "c4K08luIP/30OXcWQNF9Qth79kCROXdeLKvAhBNrtrw="
									"--out cue no hidden fields": "j49bhMaUm6bQ3tOeFBnWWc5k953+/pZphibsy0hJiPk="
									"--out cue --package foo":    "r6VVEyVqZCrSfNWJfBqqxE+E1It8W1DmZnwkuMOR6gk="
									"--escape":                   "d7ZBLEgih2FqS8rU24RXluviHrHx/YF/dEX8L5xSSXU="
								}
								upload: {
									"--outfile data.yml":            "o+rv/n1AsCtUq5GUm/eJNIqbSxz2x8/pEp+cw1/VwXo="
									"--outfile data.txt":            "ZPsZ0yZT1pAdrFrdmJS4I/Cxq4IyWO+uONSFoBvxz/c="
									"--outfile datafile --out json": "l8FUa/UX+lIXnwABgNPyC3YpE0QSdaDTgstddIq7Nro="
									"--outfile json:datafile":       "7QJ3p4e9Bc20uLExM6Tid2Btb7vS76iKo/sCFNB3i1A="
								}
								multi_step: {
									hash:       "KPSEOQK1425IA83NN81GBEMHPN1S6CBQGDRFMUGVBTBCGKLOPSP0===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
