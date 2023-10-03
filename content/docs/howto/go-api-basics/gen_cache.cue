package site
{
	content: {
		docs: {
			howto: {
				"go-api-basics": {
					page: {
						cache: {
							upload: {
								"go test code": "ik4JCoppWiT+6oe1wZ7krxZb/tir0mNtmCP70VjxjXk="
							}
							multi_step: {
								"TR13BNAHU50LOP7S2FV5T1ALKSVNDDNMIIA39UG3U3E5C904A35G====": [{
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
											ok  \texample\t0.011s

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
