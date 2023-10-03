package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							upload: {
								"go test code": "WpTTR9Cfi5jtM6zTF3LQgD1SCebbM6nJTzu1ZT7LrlU="
							}
							multi_step: {
								"8P9M15DJQF3VO4TDCL4QQ0D2GV3PO99S9LRGQSM11OJKR9UG4PA0====": [{
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.21.1 linux/amd64

											"""
								}, {
									cmd:      "go mod init example"
									exitCode: 0
									output: """
											go: creating new go.mod: module example

											"""
								}, {
									cmd:      "go test"
									exitCode: 0
									output: """
											PASS
											ok  \texample\t0.005s

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
