package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "HQ9Gwy+BDTAVgg+rZK0NotkhLAiMnbAE5HaCJl/cdWU="
								"x.cue":        "qHzapSMGrpfPFk57KLU9PCZBzXaOQwwys7iD+P32OTo="
								"x.json v2":    "JiZBf7fP2TgfTpD8sHCFqa0KcpiDbHn7KGPUdjXQYPc="
								"fixed x.json": "nE3ep0rbUxYdtOwb6PWOBIFx6LtSbCZKN3FQucyYS3w="
							}
							multi_step: {
								hash:       "7LAB9VBHCGDNNJREIA2OCP0O5F3CEFOG0DULTKQ69FUTF97QEHE0===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
