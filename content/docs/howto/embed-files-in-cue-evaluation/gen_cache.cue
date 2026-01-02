package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "0SooybLsllCuU/zojBLtx8ywe0958bqNoLSZSfkO6D4="
							}
							multi_step: {
								hash:       "IAIKU6TC1L5EK44ETMARUNR66MUURUV301OFRDH35RKB7PHQ10BG===="
								scriptHash: "46C19A4QR7I96R3DF7DEPHBOKVCKDJ2IGM7TQ4OHU0TVBFTRHKO0===="
								steps: [{
									doc:      ""
									cmd:      "cue mod init"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											oneFile: |
											  # How to use this project

											  ## Installation

											  Fetch the latest release from the official site,
											  and unpack it in your home directory. Next ...
											manyFiles:
											  a.json:
											    aField: a value
											  b.json:
											    aList:
											      - 1
											      - 2
											      - 3
											  c.json:
											    anObject:
											      foo: a
											      bar: b
											      baz: c

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
