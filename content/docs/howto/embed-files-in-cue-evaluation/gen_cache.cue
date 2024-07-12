package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "6W7qXpH0vppyXktY/X9kNEpCY0XsimpwOHzvAJWOocg="
							}
							multi_step: {
								hash:       "427CLQJE16I0G9OQUVTOHLUI9JBMLQT00L0H0D9BUAGGERAANR0G===="
								scriptHash: "L3E3DME2F61TU6U7MM9RA4TEH3SJAKLP41HV48L2AHOCOJPST04G===="
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
