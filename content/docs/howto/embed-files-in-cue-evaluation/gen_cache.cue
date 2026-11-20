package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "ICWgxheYMyN/o3mB37jjQDI436pkFWumJmMub+nfjEk="
							}
							multi_step: {
								hash:       "TBKN8EU973KBM759S3IM207BPE1NI79FKO5EU4LAT3L4B5KHGFB0===="
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
