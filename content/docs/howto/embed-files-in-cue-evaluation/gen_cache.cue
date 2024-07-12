package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "tDaqLk6ZmuUbnbHzYc6a7mt3Ly5BBjO4QMUtNPS5GAM="
							}
							multi_step: {
								hash:       "PEV2DB0BVTO6NDFU514BABGRVEO412LE0837KJ6COTSM8SGCM2PG===="
								scriptHash: "4NM7M5GCDR3KKCKBP6THR342PMKGFK0KNG5ANQNSVTVQ46CNN2A0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.10.0-alpha.1:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0-alpha.1
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
