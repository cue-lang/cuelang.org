package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "Y5WAA+BNw9Boj09mW7jEyYMsOav1mx8FkqUA4ogOplc="
							}
							multi_step: {
								hash:       "ND430CRECNGLUNJ9S0EJN8K906KHM1P7JECTQBQDFPC5KBKR0J6G===="
								scriptHash: "TMVISIT0L7KO7FNL19TJOD1U6C9RHUT0JSTHSN89257P72DP3GVG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.1
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
