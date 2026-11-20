package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "dB6uNMKXO54HIGD8/4MByt9poajs+1T3zcAgfdmGm2U="
								"create local greeting checkout": "pt78eQlXdBqUjn7QWNIbGGvoCs74Tz0xSXVRop4iaq4="
							}
							multi_step: {
								hash:       "F6EVP58K7DP3RP36I77MCOAURMQOM66PAF5MM8KSGU1M70U5H6NG===="
								scriptHash: "J62LTQGHN8H4SD3GK79FL2GTGF0RFNPQH2KREJ8MRTDQHMHJ0BG0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261119142547-4feb85fac20e:$PATH"
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
