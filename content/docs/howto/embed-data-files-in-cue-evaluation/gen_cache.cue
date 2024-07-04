package site
{
	content: {
		docs: {
			howto: {
				"embed-data-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "EFkd/DEp4OOJ4njLRi2zAr1w1geje5oC0DFMdTBUOK4="
							}
							multi_step: {
								hash:       "SS7I6VQ0JIR0934BU3GV8BKHG2GEP3A59J7ROGIA8I31ASPU2RQG===="
								scriptHash: "R0BPDJQI69CIOQN7129UUI1V29RMD7N2TBU65IM0NSTNS2RSEEA0===="
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
											    anObject: {
											        foo: "a"
											        bar: "b"
											        baz: "c"
											    }
											}
											manyFiles: {
											    "a.json": {
											        anObject: {
											            foo: "a"
											            bar: "b"
											            baz: "c"
											        }
											    }
											    "b.json": {
											        aList: [1, 2, 3]
											    }
											    "c.json": {
											        aField: "a value"
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
