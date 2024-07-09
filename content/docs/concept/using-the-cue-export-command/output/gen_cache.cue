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
									"change output encoding": "dF6gT6seRMOoTNqdJxHnmGrkQs7HBIFnXUiY+1sI2B4="
								}
								code: {
									"cue export cue": "NqoeSj8RdCFbNR6nB7DmbgNZJyFqZnYSUP5Xkl+Ysgs="
								}
								multi_step: {
									hash:       "B0OFMUI36EN9LRRKA6M3HE9AR1M8L65270GS0NBSU3V32TED2AD0===="
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
