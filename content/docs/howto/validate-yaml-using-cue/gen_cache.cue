package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "merGo1Z/25LLQnPYpb7ZosdKIHf6aZOtLj48WEthvoE="
								"initial x.cue":  "J/S1QR6VR8z8WhkXHlP8fXxo4ZLEmAC32mZjOrG4xwg="
								"another person": "E/DPDP9pHDu2kRA22wvhyXh9mso7xDbSBVr/i06E0kQ="
								"fixed yaml":     "xahrKkvFZQ29bBQBrwXE3XZKLM6B6w7MBXg4jXVeQJ0="
							}
							multi_step: {
								hash:       "V04D8LJ3D7TBM5RS4QIVTL0CK9PC9UU23OPGLF8DGECOI54BJSM0===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
