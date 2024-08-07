package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "BMEhBSfuz7QQ+EGkUYmv5+CAt5TcDfAYeAKzikpNULg="
							}
							multi_step: {
								hash:       "Q9KCE99H07SI2N0S7V2KDAH2BTCMSLAIT6EGTARF8O9HSTD0UJQ0===="
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
