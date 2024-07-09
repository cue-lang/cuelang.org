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
									"change output encoding": "sQFrXxvVXEX2EDDrGxAUE2K+xBBHKGQtiSd8ne1UjqU="
								}
								code: {
									"cue export cue": "+oyaYojDaXz28uGOqoq61g25IUtYdJmRFVk3MFdX1hs="
								}
								multi_step: {
									hash:       "FNFTM81DARRQ2FMDJ70S6EJTKMC9417G2T1H4OJQDL8KCO978UBG===="
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
