package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "IquFBSeqdE5CNjVSpDPh2fIe9jUzejcQOafZPkMA3Gs="
								"create local greeting checkout": "Zl51zZizD3byXCQkllxK9EtyEKGHmqd1izmTsRUPuKg="
							}
							multi_step: {
								hash:       "P1JQRRGA4K2LLFERPFUUTLOFQD0R73F14MU5MCSDBI0HG912TKPG===="
								scriptHash: "44A9NA05FMU4V8BUA47NIBJIP3N613QOVVCKDVPVPR4S7BCESL40===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20261002131943-93402de82790:$PATH"
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
