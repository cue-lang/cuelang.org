package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "YgBbN12oRphgH2OgXMU8zMcNdVF8RB6c7A5T3x1EtGI="
							}
							multi_step: {
								hash:       "97TTD2CK9AJPB4JHPUK8UO6TMIVONSPMD1DS3O50CMM5REQKK49G===="
								scriptHash: "7UQA4IRSU3ETSEOBTAM448DPKSGBMH1OERDEND2LBMQGSO71U650===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.10.0-alpha.3:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0-alpha.3
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
