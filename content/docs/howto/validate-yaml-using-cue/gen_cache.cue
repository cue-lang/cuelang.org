package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "DKnKEidSU8h5nYwXhk63dWn1KaFTFDwWVAAEB8/Xj5w="
								"initial x.cue":  "M+HWLt6y5sw/p3Po27p0xqk09qrQSGnO/F5XLOkjEXQ="
								"another person": "Nk7NxjMigfXLSBeqN4u17tY8u8dHDaPnxJCXkjF3DtA="
								"fixed yaml":     "u15piyQ3pART5EPGbQPO3AlT39PVpJZuMAJU1/RTkkQ="
							}
							multi_step: {
								hash:       "6GE2JIOSSBDUA6V0OGP2LR53EFVIRF61AVGJTFRTMAE3098I6IDG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
