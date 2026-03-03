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
									"default output":             "Su/3xrZOW/sKiNva4ZKxsBG7Yp7w+5hoJR6/SgZf/SY="
									"stdout yaml":                "X9WbbZMwsBbn/Aj3+b5OeaI9+1JNf6smq+hkYsDZ74w="
									"yaml:-":                     "OO4O7ImqajHJnKpAJzW3pPql2R2wxnS038sRtKnoI7k="
									"--out cue":                  "28dmqihA7Q9/wrOjgbWWP/P6hk9gAfGSFBbX0eDIqAs="
									"--out cue no hidden fields": "mMWkLZ5pR7bl2pJgz0aO80i7NgWekaTUKDFmbh+0uRs="
									"--out cue --package foo":    "ujcS4PgKaZbboZ69MAqEjpG0hykLCeY22WI63zxQm/s="
									"--escape":                   "U68sCHM/GscRhHpBkRHtFr0UdqtD30nTMZf9n7DSWtE="
								}
								upload: {
									"--outfile data.yml":            "/iuY6lZ5MFgyRUyYFq29X99f/rlpMI+cWn9mgLsNL8A="
									"--outfile data.txt":            "V/f4EhCKuyyis1zjeE/vv7NjYbXozFU3DHjHU5oRY9c="
									"--outfile datafile --out json": "rfar+XXJpZ+x5vhngAlAHGjiBKFWnQLCNxSeoPg1HY4="
									"--outfile json:datafile":       "e5Hdr/41qbldqrXj6ZV6lG8Ghqqxxaj8D0Tjv6TCSpM="
								}
								multi_step: {
									hash:       "289DGP3NRJ0UK3GO93JHRQ6MGT3H8B1PVJL63QU4BBS6CILOJ5U0===="
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
