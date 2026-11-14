package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "i5sWGUZ3X1i+rB45TqSlIqbXoGKP3qCBQTOs8W7qNAo="
								"create local greeting checkout": "U4TeMhi77hxTcjkgOeku57I9I6562R/vDPfwcGD0SLk="
							}
							multi_step: {
								hash:       "0KC42MBP2LGF1K17UNJ9UU4HEFN99ON7AO6SKSBF0CHO825GHJ7G===="
								scriptHash: "INIBQQNRNVQR5D76MLBA97Q0OG3BR1B8NT8TKS2Q64GOARKIK1H0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261113115251-a5a9a9c5a2df:$PATH"
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
