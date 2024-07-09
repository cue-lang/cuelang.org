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
									"change output encoding": "H6qSqz9dxNuF0JTe+WtH2zyOksb2wyR66Fu9K+NKLfk="
								}
								code: {
									"cue export cue": "qy0lZfmExe6CYQsarLJacF4fYGvgMu76rRw3EkDIdT4="
								}
								multi_step: {
									hash:       "EAHGFK29S0PSC3HSUFEIS542U1SCMG1SNV18H0S99MSE1C7G7M7G===="
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
