package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "VJAVLFdYQnTrOoXoc9gL292KeYl51kDuABrQl5MrIwM="
							}
							multi_step: {
								hash:       "S6SGUO1H9869KDTNE40P3HDB01961KJQ195O2FTNVCAM8JGIVCVG===="
								scriptHash: "422EDC6FAKPK1UK5BKQ32CU4SK8AFELNGB6NGFQPGHPEEP65GUA0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.10.0-alpha.2:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0-alpha.2
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
									output: #"""
											oneFile: """
											    # How to use this project

											    ## Installation

											    Fetch the latest release from the official site,
											    and unpack it in your home directory. Next ...

											    """
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

											"""#
								}]
							}
						}
					}
				}
			}
		}
	}
}
