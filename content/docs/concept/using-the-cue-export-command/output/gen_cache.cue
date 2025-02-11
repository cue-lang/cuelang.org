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
									"default output":             "iBHhwidSfwvKp+Nz7U4KVWsT/M04hiCGsfhkJwNF3aE="
									"stdout yaml":                "17DMxoFWAOCYyhnfqBtKpo+dgOhXHtbflkrCKPjIDKY="
									"yaml:-":                     "GGsmJhMeg5gCxlXl5z2msoVsiEWgrlenXQWGCNp7gyg="
									"--out cue":                  "mfdMGXYzbF5mUBftkHY4tezGOn43l1FmlkFpVhgMyyQ="
									"--out cue no hidden fields": "r8YFO2PpL1CeECFrf3dvDU5au1x6aBK1M2tIddDKAa8="
									"--out cue --package foo":    "VVFXQwbYtikwv8lkt26BXICTmu/38ne4zTy2D3RAdhM="
									"--escape":                   "OAyPQXSUkS8XdtdypbmPcaxZoHKzhzUakhXMb7ttM9U="
								}
								upload: {
									"--outfile data.yml":            "jZ++eUIJuQWvRpM66MPi/+0YOuiIxZ8mQcPoHTg3G4I="
									"--outfile data.txt":            "5ZIijos0hm5z8aOoBgB3OnpRiuhETKs4aHEc6VBYgjY="
									"--outfile datafile --out json": "FKRTrcqr9U/wLfvJdL5ARDke95PHNWSf2u59Fw1w8iM="
									"--outfile json:datafile":       "xDWWqQnivrHxE3C1Dpu+HDzfdfYowHfZ9siof4meNSY="
								}
								multi_step: {
									hash:       "7NROSGV1SDP1GQ5626C03QQLDJ94UO705ULOJK6QOV6G51JCOQTG===="
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
