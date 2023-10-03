package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							upload: {
								"go test code": "TKvPgpq7jKL+qW1+n7jTSns6za40/w9g0fsBaq0OJOs="
							}
							multi_step: {
								"VIV2B4TKSM1BEKJVUTEQ35GATON717V9J7ALL0B009N3H35QNMDG====": [{
									doc:      ""
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.21.1 linux/amd64

											"""
								}, {
									doc:      "# we should really use a full-qualified domain here"
									cmd:      "go mod init example"
									exitCode: 0
									output: """
											go: creating new go.mod: module example

											"""
								}, {
									doc:      ""
									cmd:      "go test"
									exitCode: 0
									output: """
											my
											from
											of
											the
											ink
											runs
											corners
											mouth
											PASS
											ok  \texample\t0.006s

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
