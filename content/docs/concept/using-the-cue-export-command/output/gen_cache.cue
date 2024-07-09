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
									"change output encoding": "rxq+8lmBo4Paw0LmZOYkCJNbYKCgobw53ZPKof/g7qw="
								}
								code: {
									"cue export cue": "XBIkUmBuhb+gMlrxZldC25EIkZ2ISE47Bh5rM0WKCVQ="
								}
								multi_step: {
									hash:       "R8MBFTLVVS3AHSLAV98V83NQGT976B0GIE2Q7QODHE5KPIANJIU0===="
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
