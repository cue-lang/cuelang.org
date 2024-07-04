package site
{
	content: {
		docs: {
			howto: {
				"embed-data-file-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "Z3DsAhXRbM8eFOjObXG5Naxm1/ws8YE/R/XIouMJoas="
							}
							multi_step: {
								hash:       "F7C0LO73LAIPD0SDD85BJG890BDHS3O6S8AB9UTSJDNFJF5704KG===="
								scriptHash: "5PMR0JGAKCDVEHP8AQJLP4KUO381BDE1BH16782L4IR74K1BBFQG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.10.0-0.dev.0.20240703133932-f1f0963cb0f9:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#TODO: remove experiment as&when it's not required"
									cmd:      "export CUE_EXPERIMENT=embed"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											someData: {
											    dataFromJson: true
											    aList: [1, 2, 3]
											    anObject: {
											        foo: "a"
											        bar: "b"
											        baz: "c"
											    }
											}

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
