package site
{
	content: {
		docs: {
			howto: {
				"embed-files-in-cue-evaluation": {
					page: {
						cache: {
							upload: {
								files: "RhBzZ4d8wbl0XtXou/Hhkxbhw8fwmPZCemNKxOZ9nA0="
							}
							multi_step: {
								hash:       "F613TSV3Q0B5E93H42T1B5P5LA6DL8RQ87ABVM370EDGFA4JIPOG===="
								scriptHash: "6CVB0H73A96VKBHC2QKK1U9V1JH3C87HJA96GOMVDOJ279QGJRJ0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0-0.dev.0.20250612173542-c92590272bc2
											...

											"""
								}, {
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
