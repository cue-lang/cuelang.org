package site
{
	content: {
		docs: {
			howto: {
				"embed-multiple-data-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "aZ3tKLSZI+fVHdjSLW1mVYIafGPHYRJp3+8r85o4eQ4="
							}
							multi_step: {
								hash:       "C01NVI8QE5K1NS4UG3NE2RVCUFILIUO2RH6QVJVVOI366O1R6I70===="
								scriptHash: "RFT2IMJKUJ5R3D0GUEOF18VIJMAPOMMV5B3U8SG9UVAPTDNT96G0===="
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
