package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "2oht1CQq7CMbBRGhhVKvHOJfdElPpNiu6Ij/vGQx/Jo="
								"create local greeting checkout": "J2GmYUAzd57LZ2u27nWbMqJS7P/a7EYH53+GrtjC7Jk="
							}
							multi_step: {
								hash:       "K7RI0K61VOT6334B2JLMJ0PDFR89L8V47DU84REA9RH9E5FRHO30===="
								scriptHash: "CVC494O8AA2L13V32DG3ND957I2BJG6V1ACGHD6G7RQFHHNSL2CG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.17.0:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod edit --replace example.com/greeting@v0=./greeting"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat cue.mod/local-module.cue"
									exitCode: 0
									output: """
											deps: {
											\t"example.com/greeting@v0": {
											\t\treplaceWith: "./greeting"
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "cat cue.mod/module.cue"
									exitCode: 0
									output: """
											module: "app.example/hello@v0"
											language: {
											\tversion: "v0.17.0"
											}
											deps: {
											\t"example.com/greeting@v0": {
											\t\tv: "v0.1.0"
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export ."
									exitCode: 0
									output: """
											{
											    "message": "Hello from my local checkout"
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue mod edit --drop-replace example.com/greeting@v0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "ls cue.mod"
									exitCode: 0
									output: """
											module.cue

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
