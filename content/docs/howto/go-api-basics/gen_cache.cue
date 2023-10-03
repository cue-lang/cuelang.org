package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							upload: {
								"go test code": "Mm2G9yflG2GFOfEYQ08VZ+fLX3GnvD3Mo8TcTHuOh4Y="
							}
							multi_step: {
								"KMI04P4QHAHV384RL7MTFEV9GMBQ4N3LAMP3FSM8VKKRNL1P6060====": [{
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
											corners
											mouth
											runs
											the
											ink
											my
											from
											of
											PASS
											ok  \texample\t0.007s

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
