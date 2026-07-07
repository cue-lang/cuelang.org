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
									"default output":             "VcfwLG6zJCX7ZcdI1nUIo27gfi/D7TP7Ylaa2aetiH0="
									"stdout yaml":                "gAlnvHDKjO41NpnGvoizxlzOvBVA6zMfjrhur9cnuRA="
									"yaml:-":                     "ZGBgB05XMdThdQ4wai4EPw8od/aDF4FigdhWmTlohoI="
									"--out cue":                  "OBnsHVR76vhnTntiXfYMORBvzns8zdBlC7wtQ+XzD30="
									"--out cue no hidden fields": "FHLFgGq0BsicO4SegTuG5qQiDK2JV8KO/7P7R28VK5E="
									"--out cue --package foo":    "7vt7EPAlTK7G1aJSoB74hoXPc0m52Fdr3rRRqT1Qe6w="
									"--escape":                   "i+g48gp4GzyXSGj9c/T95cUcFA1aYqRG6KppF3t236U="
								}
								upload: {
									"--outfile data.yml":            "p1mnEkL8F+tCdQNYdeo1nAOWCZySr9ZKMt1DCtL7Fl4="
									"--outfile data.txt":            "VHzJs7zwVZABAiFIjbqKsS4mcaDVqmDIPqTie7VmmAI="
									"--outfile datafile --out json": "RFFRfGr65o21tGsJxqcoWGZFNmdwhPp113JdCnr5pk0="
									"--outfile json:datafile":       "hjCyNUXfTtJX4QVPfroBwzvev6w9z4S2CF3RZBcbGmQ="
								}
								multi_step: {
									hash:       "69P2ES9GC6662EUA9V82523RC9BSL4COPHJLUT5JN369L1JIH2C0===="
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
