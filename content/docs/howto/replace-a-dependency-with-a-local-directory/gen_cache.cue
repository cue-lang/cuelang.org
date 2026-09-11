package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "NrEAqJkm3eAFvGyiFiihti0taOdK2fPc0BaBuxH1cnw="
								"create local greeting checkout": "/51BOVueykLeNrN+O+lQJwev1M16FaqYKl8EFpXJ3BY="
							}
							multi_step: {
								hash:       "MTGFBQ7O8ENQ9VEBNCA5KE8T22HVE63MAH6JUHG04G6F0GG9U3GG===="
								scriptHash: "UNJETM0VQ8FHQ5UF8QBH4IBGDSGDBR4NLHKE8QT6CS1IER4APIG0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.0.0-goreleaser.202609101448:$PATH"
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
											deps: "example.com/greeting@v0": replaceWith: "./greeting"

											"""
								}, {
									doc:      ""
									cmd:      "cat cue.mod/module.cue"
									exitCode: 0
									output: """
											module: "app.example/hello@v0"
											language: version: "v0.17.0"
											deps: "example.com/greeting@v0": v: "v0.1.0"

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
