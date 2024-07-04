package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "+u9UebpJb5htbPyOCMJZNlj1Saf0f83kbNN4YgfhY44="
							}
							multi_step: {
								hash:       "2IJJ2LK5KCINV82NM8JS5DV2PRU6B7JG6JD6AD0BLVQDS5JOFCE0===="
								scriptHash: "0TGIVU88PVMOUPFOJM4G2TUGRF59H1HPQ0UPC8EJ53N2428S1ALG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.10.0-0.dev.0.20240712091910-3a379b7b9eca:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0-0.dev.0.20240712091910-3a379b7b9eca
											...

											"""
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
