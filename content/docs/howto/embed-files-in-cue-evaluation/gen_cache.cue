package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "x3/LwD+uzl/JPHSMJdWl42ufU3lp0XYJy307xQL/ixw="
							}
							multi_step: {
								hash:       "NHARN2ET030JDAK8OK1E76SQCSQ16IVIVGTG50JA91UI8R9O8JVG===="
								scriptHash: "JSD1HFJOMF1GADCOLMV8GQ2NM1LKPOJ45TRO2PTUJENMUG7IRNTG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.10.0-rc.1:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0-rc.1
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
