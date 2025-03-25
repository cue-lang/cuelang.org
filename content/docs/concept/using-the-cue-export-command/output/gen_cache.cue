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
									"default output":             "GTz2L1HxSi8zm2msZt4KftaPqRTgG2jI4mGCA8IUDCw="
									"stdout yaml":                "o5aCg196VhOrvu3qVMetdHZ3LtksfeYa1Hg0yOx8ka8="
									"yaml:-":                     "vqVYyTLbrt19vS5RuIsBH16MIhrIX7G/ZddLS4FRNz4="
									"--out cue":                  "ooNJG0j6pCPRxFs/O2JU+ITgz9sSsbUEef8fvSVyaiU="
									"--out cue no hidden fields": "r97FMnqecivjgWIOD5nqazoOvNEDWzPRAIZH4gY1yqk="
									"--out cue --package foo":    "c3GKH2Q+1TnTmg+APH0dgwa/nfF4MRnMbz6stReBT68="
									"--escape":                   "frmpeYzMWtPAaD1aMEFCShMHmuAkstagdz+3AMW/W6Y="
								}
								upload: {
									"--outfile data.yml":            "ufcRs9TysJgQjdYdNVr7S9gQJlwV4r6HkFPecA9YLWc="
									"--outfile data.txt":            "w+zGbFQfe8G3MKavsyX0EaLKIZlROA+2xwy4Ez0av2c="
									"--outfile datafile --out json": "HlTDNcF+0YhuUOVr8K5QzFC+ak1yzIAkGxRM7okBNtE="
									"--outfile json:datafile":       "ii79P/MDS3ifRYFl22rtXDrEopRSPd3CtF9N1s4yfMo="
								}
								multi_step: {
									hash:       "29DAHN2AQ6DL4UOULQSGOILGG9NR894PSCKMR168G5FKLLALB2UG===="
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
