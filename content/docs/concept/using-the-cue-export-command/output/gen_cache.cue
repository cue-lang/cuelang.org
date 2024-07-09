package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								upload: {
									"change output encoding": "L7gytkgJH7GqTUpec2jVtD6k7qPhxulVpftanl8/5QU="
								}
								code: {
									"cue export cue": "70CRCHd3PinX+mOx0m1CVj0IdeRwUvhgo0D1o7gm3Fs="
								}
								multi_step: {
									hash:       "9NDK3COFGDNFVLH4D1F0EI8K6C76V2VIO84D9NIVBU8EE55SH5F0===="
									scriptHash: "MCPJ1E2T5R5B8V8FOCV47G3O25480CKN5OOJHB7L0LBF6UCAU8E0===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile some.file --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat some.file"
										exitCode: 0
										output: """
												{
												    "Ae": 1,
												    "Be": 2.2,
												    "Ce": 3.33
												}

												"""
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
