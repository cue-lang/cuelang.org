package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "YcwaWejvj+OD+P29cCvKIiyCGsficcG/swfSM42GyZs="
								"create local greeting checkout": "8rKh6WDENb081pma+vxz5AiknQWXQz+hCpkk37149iQ="
							}
							multi_step: {
								hash:       "F6VE0OT3R3BVFT1OKHKSTI8MOSV9GOPMQHRDE2SQ1SIKM024P9M0===="
								scriptHash: "B85J2698B0FV4SI7FFMCOD7PHQMF78UN6E44SIAVGIUAR3D9G590===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-rc.1.0.20261023142911-c9393fa32ac5:$PATH"
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
