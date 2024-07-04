package site
{
	content: {
		docs: {
			howto: {
				"embed-data-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "urJCJlLMM4FNlhIW6ET7z6nFT7aJiNoXZCYzq6mNe40="
							}
							multi_step: {
								hash:       "O1EI8LBHTD4HA78B7LA25H884P9BV1DV45983F7E1LC673I0E0EG===="
								scriptHash: "5S94B25IPTA4ILKIQPF58JRH54AGDT2N2HE0HM1BF07HTCM2PNT0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.10.0-0.dev.0.20240711130617-fed43b04babe:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export CUE_EXPERIMENT=embed"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											oneFile: {
											    aField: "a value"
											}
											manyFiles: {
											    "a.json": {
											        aField: "a value"
											    }
											    "b.json": {
											        aList: [1, 2, 3]
											    }
											    "c.json": {
											        anObject: {
											            foo: "a"
											            bar: "b"
											            baz: "c"
											        }
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
