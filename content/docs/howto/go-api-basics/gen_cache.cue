package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							multi_step: {
								"3NNFGE3QLQNKE8N5U38ANA1HL8P55S3D7OL75KDTELEP6BIRKSUG====": [{
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
