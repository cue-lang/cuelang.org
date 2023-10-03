package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							multi_step: {
								"N3P4VLKD5GD9QK380BGO289K2O0Q13M5LEHOODP36J5Q0DRH5B70====": [{
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.21.1 linux/arm64

											"""
								}, {
									cmd:      "go mod init example"
									exitCode: 0
									output: """
											go: creating new go.mod: module example

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
