package site
{
	content: {
		docs: {
			howto: {
				"replace-a-dependency-with-a-local-directory": {
					page: {
						cache: {
							upload: {
								"create hello module":            "cH1CJwNQVBUQwK90GL+3Zu9zbpNOPjIoZDzvlTPgCRs="
								"create local greeting checkout": "Or/3J2MNnXi+3sFHk5N3QHQ31hZvsGIyRXOZy9iD1FM="
							}
							multi_step: {
								hash:       "9OJU84PHTV72FF85VC19UMQFQ0AJK1EAPNNIT8KR9KSGKC9FEN70===="
								scriptHash: "H2TMS4GAT2UN6LCDOF2AUBV6ELH47UV0EE6SUPR729KR0N16LL30===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.17.0-alpha.2.0.20260610123057-092c2816a629:$PATH"
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
											\t\treplace: "./greeting"
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
