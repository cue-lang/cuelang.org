package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					page: {
						cache: {
							code: {
								"export defaults":          "5DEfG70tmQVPN7XSaCHAdnJV+UW6yRYqpeuqRFpHwog="
								"export override defaults": "n8olbAg+QvxtXAUGMneeoMo1+VydjJxwmwDjUz6DEjQ="
								"export fail":              "D0cz0NfdhesPb4ulRsM1pyM6od8KO+YazpH+c0SWmtY="
								"cue export cue":           "XBIkUmBuhb+gMlrxZldC25EIkZ2ISE47Bh5rM0WKCVQ="
							}
							upload: {
								"change output encoding": "rxq+8lmBo4Paw0LmZOYkCJNbYKCgobw53ZPKof/g7qw="
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
