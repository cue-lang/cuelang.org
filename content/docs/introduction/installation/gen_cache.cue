package site
{
	content: {
		docs: {
			introduction: {
				installation: {
					page: {
						cache: {
							multi_step: {
								hash:       "JMPHMKTM994AD5H0EIUI8GI3LS0D55AKUNOMUS6QLAVOPH06P0KG===="
								scriptHash: "4O4TRMK0RCF56FFG4LH9B2ROK6V1V5DKUFOMVQ6MHB49HA0I197G===="
								steps: [{
									doc:      ""
									cmd:      "go mod init go.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module go.example

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@latest"
									exitCode: 0
									output: """
											...

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
