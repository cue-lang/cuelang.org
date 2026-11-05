package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "oXS6xoXQEhumW6AFuVxE5XMjSBPIY/XuMc7bhOIpQIk="
								"create local greeting checkout": "TsozjkXhgJZZlJM9moFaRUq7+S+Zmj2WPbj0nhRq53E="
							}
							multi_step: {
								hash:       "3EMI3C251DTRGPSG4HEV4CU480F1FOFC8S4HRT0KQVID8RN4I0EG===="
								scriptHash: "AB54M7LGB710T238FM51E6LB1GMJU832KHNLPB13566PGFAKEOU0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-rc.3.0.20261104170309-b057976c6156:$PATH"
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
