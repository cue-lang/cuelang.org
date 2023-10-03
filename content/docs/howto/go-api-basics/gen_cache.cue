package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							upload: {
								"go test code": "H/gh82IlQR0LZA9pFRFYFC/vSH6d3FpdsW5/3zeHoUw="
							}
							multi_step: {
								"OA6N2MPC2E6SDO4S8GRHN9DNFS61JA1R3RL1D3D96RMUFGSGUPK0====": [{
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
											ok  \texample\t0.002s

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
