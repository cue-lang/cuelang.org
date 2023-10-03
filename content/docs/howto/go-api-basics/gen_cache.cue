package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							upload: {
								"go test code": "2EBVOf9fjF6CwL8V3riz+TpjfKmdlFyILZfZkPyiC6s="
							}
							multi_step: {
								"T8QVFOHM2KM8GIUFFQFNRCRLK7497KU02QNBCDN2PCIGR89I4D4G====": [{
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
											runs
											ink
											mouth
											the
											of
											from
											corners
											my
											PASS
											ok  \texample\t0.004s

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
