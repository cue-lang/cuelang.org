package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "YoaGj/5pKkhC0PFeKz+htJtb45C1+yKlfeC5WZaBJoE="
								"create local greeting checkout": "z9ZBuLmar+NJppHL9j74x8tai7OSddqIOJqgjYZsjYU="
							}
							multi_step: {
								hash:       "DS8J4L3CC5EE0IF9TSPP3BOMINQVM33CFV3KDD6VQ8VFBKME1Q10===="
								scriptHash: "K9JC6EOSHSVLUDKI7UJPMJ7GU989K0GMB74G15M0C5Q14R9FL38G===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-rc.3:$PATH"
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
