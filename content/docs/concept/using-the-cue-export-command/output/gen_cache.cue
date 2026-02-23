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
									"default output":             "dK9cO1IfGgjZeA44YfCQTtxiY7QkkMo1li6oYcFiEow="
									"stdout yaml":                "4r/3bR9gvtS1YFzXj9v7yIKFd62n22xLUOCC+gzYPTc="
									"yaml:-":                     "Azop9k7EKrTEjXx+b52OJ/xBe4OA+kQX/BtILNX+l+s="
									"--out cue":                  "DyiYi1UU1EBn7BIj51W4YU3fg5BoDMNasIlbl2b90+A="
									"--out cue no hidden fields": "Tb7xwmTyLHJOEA8VXbrEXDZHAOmsJHefDnN4XOxOmR0="
									"--out cue --package foo":    "i/++yd/i+Srj+G7Sp0g1/CJ1l4a1CFQ/WeMJWjWbzu0="
									"--escape":                   "c+iIs2J29NJRFBOrnGXlr8xzTPbsE85vRiiELCVtpwc="
								}
								upload: {
									"--outfile data.yml":            "8BTcKMzVTVqYc2povIKhmKmtQPZ7IYyroXa0Ge7qd7M="
									"--outfile data.txt":            "aVbd/4aIhEg8WVfx7KEXBCgY/g8rp2rH1nYe2JSUHSo="
									"--outfile datafile --out json": "8qTh3MYgUk9XU6+PpItXEsEel7KXOZVz+TrdvAQB+mU="
									"--outfile json:datafile":       "AYGGCY8OoVEN/3fvE4dQQlxTm0gGF2e1u7nJq9sLnvE="
								}
								multi_step: {
									hash:       "8VNJ1KMSTFR52FA53TGKU8N07Q3H43G90RTL6NPB2I14D3FO1B20===="
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
