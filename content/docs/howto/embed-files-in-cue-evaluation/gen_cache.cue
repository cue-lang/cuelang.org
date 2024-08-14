package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "kHki6qejp7i4t7JzS4yt2SjIzkE17xIF+hdGcQSECf0="
							}
							multi_step: {
								hash:       "7I6LILNL909T4C60DC8FMVI3MTOV4RN55EBL2PS5OOVPE8M8PGJG===="
								scriptHash: "TMVISIT0L7KO7FNL19TJOD1U6C9RHUT0JSTHSN89257P72DP3GVG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0-rc.1.0.20240814100303-dc3ba30322ca
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
