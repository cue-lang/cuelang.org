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
									"default output":             "n6Q1WHxbqtFC4zis72y8CwLKpPx9HAa/rthNOAprcyQ="
									"stdout yaml":                "5/pm6NoxwH0C37nDLnujylyfMNLMFP37/HmLItkNjaI="
									"yaml:-":                     "4oLuhWvYwgtiwhgUBQldIRNyAR1P4TNd66z2l7OzAZQ="
									"--out cue":                  "9Kb4ShgzsMdTMPtIy7jMjqlH1ysh9xoAjfwqDXVgIq4="
									"--out cue no hidden fields": "Ma5Oqj4kCFNOGC/qVQ6npsiztdPnB6dN3zWKa5IFUM0="
									"--out cue --package foo":    "ZaHeYBmq+uMYdZH5+DZVY9yi48fnWscsCKujoszTQUQ="
									"--escape":                   "pty2qvc3vyJLFKs6NfQPsgveibj2R1Fv5LP3E7TYeq0="
								}
								upload: {
									"--outfile data.yml":            "sJAl6fH0EAsm/X3ZCh9Ou4nrxaTVdg7QPfdYkIoCDvM="
									"--outfile data.txt":            "ANRqHdjmKKz6jAOnEx/sooxT2XDUQBBbc1Bwis7sTrQ="
									"--outfile datafile --out json": "h5I6df682BnJ02HaA3pcDbhib19hy0VSousLBic5jhY="
									"--outfile json:datafile":       "FhnfKKTciytrOgbmzK25gmhR9zIkCl1shf5zb4txqtc="
								}
								multi_step: {
									hash:       "FBA5E2TQFS66P4KRBCORRMBSDI1SD2LEISNM6EO7D7KDBA21HS7G===="
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
