package site
{
	content: {
		docs: {
			howto: {
				"place-data-go-api": {
					page: {
						cache: {
							upload: {
								"initial cue code": "gMKHkYUfuinmR+O5QZ1d1Z6EI71elyXDTQGG/V/5J8o="
								"go program":       "VpGy9o+xxzIuFgqzNfExnPCnMhkGxd0RCFWGukUpRcI="
							}
							multi_step: {
								hash:       "K04DNBGVEQ01PCVEBO0QCG4QMREU4MAHA8GJFBFOKRV7FD6O1FL0===="
								scriptHash: "FS2QTTF3KP29SMDJ7TOMVKL8GJ94T47QTVKV73I9SJ3L5V7GRAV0===="
								steps: [{
									doc:      ""
									cmd:      "export GOMODCACHE=/caches/gomodcache"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export GOCACHE=/caches/gobuild"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init mod.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init mod.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.10.0"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod tidy"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "go run ."
									exitCode: 0
									output: """
											"Hello cueckoo"

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
