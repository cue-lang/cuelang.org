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
								hash:       "80EJKNB541TN1Q8QI1CO5H8D9BFLB13C8B3KT1BBTFI7FISIJENG===="
								scriptHash: "ACSG049BGC84VE14836RS1LOQBRN4E9JVLI7IVCBEKNKUP2P21H0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.10.0-rc.1.0.20240814100303-dc3ba30322ca:$PATH"
									exitCode: 0
									output:   ""
								}, {
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
