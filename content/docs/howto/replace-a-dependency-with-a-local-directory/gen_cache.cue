package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "Cb3CbZDnIOdiYNS8EkaBMK2/ujNl2jxZ5koQvHzXBJ8="
								"create local greeting checkout": "+ijDi4Hm+vYGiJbfzDXwN1Nh/O+7awngFksMDvI5bGE="
							}
							multi_step: {
								hash:       "SGKA5FP15PUC03LTK2DSJO12HVJ9158VL3MN8OV0JTL5S8SVPA9G===="
								scriptHash: "7UE99ST3HK1VGIKI86P0UKEV5SC88N5HVVKK0I3765SD90J2UT90===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.17.0-alpha.3.0.20260615112339-9916719a3eb1:$PATH"
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
