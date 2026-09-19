package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "dAFhN97qm6PH8vLD2u1NE+qru+M5uaWZK4oVFDPFhhA="
								"create local greeting checkout": "iGDkn/e3S19fuTAkOR7VbJtHUVjL8onZ39Veq+FIWaM="
							}
							multi_step: {
								hash:       "KPEIUV4436LP52T31NNG0SESOSE9KPFR56LDAPE7RI27VT20BSMG===="
								scriptHash: "JHO3K0KGTPAKOJC5FHT2O65TQVQH35VAGQ7LHMSFGHO4C4U7PKP0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20260918143709-50e1f64b6460:$PATH"
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
