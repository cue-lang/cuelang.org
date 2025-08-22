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
									"default output":             "gAl/28OHKgYlWdAexRjqysUyhcOBZFuWZy6xEJTCKS4="
									"stdout yaml":                "m1Y/EVXhM/Lce8ty3BECrCwgRi1Z4FTDd+Gwqus7GXU="
									"yaml:-":                     "8U2SS12mnF9+cTmAWhCra6GN/ERwMXaeCFFe3Ev7yXQ="
									"--out cue":                  "yEBJHHXs71sbMz2q5KlQsU7TBkp6FivdL83PyH5ftQ4="
									"--out cue no hidden fields": "J+yd8WccRqRK/gwlLq6C7U6ECOHEeAkU63MXg6Uta48="
									"--out cue --package foo":    "vWAHctx6/OjK8AOyn5LWc3VgjuWnRlJDqZeeKwt2KUY="
									"--escape":                   "mrwCGi0XTF5u65LAi3RF+3hY+TnjuU0AOtAOp0mhoy0="
								}
								upload: {
									"--outfile data.yml":            "oh7b21qAmGl6vI1D5kQIlfBYxVm8H41tSBT/7RTW2NM="
									"--outfile data.txt":            "xs1OWEvhmjhs5ttSXwMX/4Hneq9gaL+GISJWe7GsqGE="
									"--outfile datafile --out json": "z5JaRv7Q6zO0CJdO5WzHCruM5AscLRz8bNsP/iARf4k="
									"--outfile json:datafile":       "U8eFYwzaz/8zEVaneKIWXMxB7XgadS22Y7ort7CM3hY="
								}
								multi_step: {
									hash:       "TA6F7262THO122QNV4MH7S98LAPVUB3JPAV5DPKQ0BIS1605KOGG===="
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
