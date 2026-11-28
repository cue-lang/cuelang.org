package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "EpdaNNI5yfgGW0BAdy9glLVBMwzwh0gjoumMTewvyFU="
								"create local greeting checkout": "XH5aOf4P0fCkmXod6gHQYL5Ei0Msz4U8x/dZJQPs2Jw="
							}
							multi_step: {
								hash:       "1D17SUDK0E82SUQ3DGGC0FRB9SAG5F2C9J6LFAHOJD1BIRDK7SQ0===="
								scriptHash: "7H14JJB4PSKPTCIOGKLT771TDQJ4B5NQ96DUF3KFTFKDNOPUF0Q0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261127222705-d53722b2b9cd:$PATH"
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
