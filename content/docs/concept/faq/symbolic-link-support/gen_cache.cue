package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"symbolic-link-support": {
						page: {
							cache: {
								upload: {
									"eval 1": "PHYavpjrGfVMNV0NXq8Nu3vHoIlFAT4WJofrfGyi87c="
									"eval 2": "XAeF0DGI/4NPIK3BzMvRDzhr3JQ03Scwx0XtX52UeKo="
									"eval 3": "PVm35he3hwS0nlleFtjcb2qatmmF1goyvLZBDtTABLY="
								}
								multi_step: {
									hash:       "O6801P287GQ5CMNOS4VFCBRRLIFIVQONN754UTI011PB43TJSKE0===="
									scriptHash: "AIQQ08HOC00T7DJDIAAC26HAAA7K2NA4SS2NA7U0QCB1RM97N2L0===="
									steps: [{
										doc:      "# CUE's behaviour when no symlinks are involved:"
										cmd:      "cue export --out cue .:example"
										exitCode: 0
										output: """
												A: 1
												B: 2

												"""
									}, {
										doc:      "# We move one CUE file aside, and symlink it back into the same place:"
										cmd:      "mv A.cue another.file.name"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "ln -s another.file.name A.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# CUE's behaviour when a symlink is involved:"
										cmd:      "cue export --out cue .:example"
										exitCode: 0
										output: """
												A: 1
												B: 2

												"""
									}, {
										doc:      ""
										cmd:      "rm A.cue B.cue another.file.name"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# We initialise a module (required to use imports):"
										cmd:      "cue mod init cue.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# We place a symlink at the path \"foo\", linking to the directory \"bar\":"
										cmd:      "ln -s bar foo"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# CUE's behaviour now that a symlink'd directory is involved:"
										cmd:      "cue export --out cue .:example"
										exitCode: 0
										output: """
												A: B: 1

												"""
									}, {
										doc:      ""
										cmd:      "rm -rf cue.mod foo bar example.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# We enable the file embed experiment:"
										cmd:      "export CUE_EXPERIMENT=embed"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# We initialize a module (required to use file embedding):"
										cmd:      "cue mod init"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# CUE's behaviour when no symlinks are involved:"
										cmd:      "cue export --out cue .:example"
										exitCode: 0
										output: """
												A: B: 1

												"""
									}, {
										doc:      "# We move one JSON file aside, and symlink it back into the same place:"
										cmd:      "mv example.json another.file.name"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "ln -s another.file.name example.json"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# CUE's behaviour when a symlink is involved:"
										cmd:      "cue export --out cue .:example"
										exitCode: 0
										output: """
												A: B: 1

												"""
									}, {
										doc:      ""
										cmd:      "rm -rf cue.mod example.* another.file.name"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "unset CUE_EXPERIMENT"
										exitCode: 0
										output:   ""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
