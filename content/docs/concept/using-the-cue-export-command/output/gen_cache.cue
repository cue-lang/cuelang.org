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
									"default output":             "/Jab+7iYvHWbJ/AA1J9vcwZqGfggOadOGP+LTNPe3ao="
									"stdout yaml":                "XTA8Att4r6hMJ59q1pUfIMcdL8kT0ebXItuDGDGWGoo="
									"yaml:-":                     "UCbyfRJCJ8hMdxuH+C0EDCK1J9y6HbuRTXJ+xVjotiA="
									"--out cue":                  "PDF9dZujW3fupYIxVRcopMNZlzM6HMWdiAznXqkdeNc="
									"--out cue no hidden fields": "ciIVpICIBvzGe0y5tIz9g/kWilbiAMkWHZ5kIUcHgI0="
									"--out cue --package foo":    "NONtkOocl8GM9SvO/IpOvEtwyRfIpktcLdioxAAsZiI="
									"--escape":                   "tlkTqkGMZJu08WuvVoOCCzlPYT89N9ZIQJZS36gAnQ4="
								}
								upload: {
									"--outfile data.yml":            "BqCcuVKhgJmqdK+6fpu9j5Uruq2b6/JxTTLf9UJvmWU="
									"--outfile data.txt":            "DHhipa/kzMk7wlfy8+QFruG1VQ6zvyImVK+tQ0yZocE="
									"--outfile datafile --out json": "C634v56qdAf25VHc8y1WuoMnlvBS4peM40zJNw5R0Tk="
									"--outfile json:datafile":       "gxL3FamesYX8QO/SgEzRy2wC80RP1NxrQWG99lCiAHA="
								}
								multi_step: {
									hash:       "QVUKE59EJOQL47O7Q4OFTF92D90FG5VHJ1C7USTL8M2RB9FUF0JG===="
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
