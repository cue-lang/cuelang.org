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
									"default output":             "KlBgBj3kSSC+qJc/QliRzg2eMRAasQcq/YbKxQfm4Og="
									"stdout yaml":                "mt5mZbzVRBTCtI09/N23qD+mlUvm6a/UGIAl92T5Yx4="
									"yaml:-":                     "cXcQj8cVwNrPVmwdk8QsTCbphyVso1Swikj/EB1oX7o="
									"--out cue":                  "RVN5JoS/Jqogd8g6Dk6QyKsOi9ocTDmS+tn1LDzqPLw="
									"--out cue no hidden fields": "5OS2xSykkCew6Xkqck/WxJfhCZQzpk/5h6ktZKZYrLg="
									"--out cue --package foo":    "RSqgl83pKJmblfy3KmzcPU5XJPFN7h6tB0FQgutJbBI="
									"--escape":                   "zvZu+Mw6i2KS9a0rsQnbbPPz2NbkK7/XQ2dZzUmGeP4="
								}
								upload: {
									"--outfile data.yml":            "WYJRE9JETkGgcldcoCx/zzrIbxLgt1moeEKaws0yz8s="
									"--outfile data.txt":            "qRwIZj5Ia6bw7BND3UEjYlHBB04WJqpooU6ySAK8e4o="
									"--outfile datafile --out json": "8hh5/NpmhoOFSymtSZQ02B1wcZW6ehrntVOHI4PNd7w="
									"--outfile json:datafile":       "GIEWiQEckKqjSq6NvmP0uXuWHoN7fPU1dmrq5mxOdcs="
								}
								multi_step: {
									hash:       "2S8JU8P6NPGKU8ABDJR2EBJ17PQ2VKR50LM52NR3RSQ8OPVPDD5G===="
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
