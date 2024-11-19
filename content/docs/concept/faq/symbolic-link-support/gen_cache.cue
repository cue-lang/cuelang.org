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
									"eval 2": "jQtvftSXmYozOehmfm+s4XVwiDgO0do9xgdscOX2Fzg="
									"eval 3": "PVm35he3hwS0nlleFtjcb2qatmmF1goyvLZBDtTABLY="
									"eval 4": "0oVXiTA3QKbEnAxTEhXWwWVB7/NFpQdyv60nxkS1HBw="
								}
								multi_step: {
									hash:       "1GDNEFSQ307NPTH8VUFMULCEQ8EVC94APSTAGFJT97OT43HRB290===="
									scriptHash: "NSHMNBP143H5365NJQ7R0P99EAJF7MH1IJ26N6M7DLUNAVHHBQNG===="
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
												A: 2

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
									}, {
										doc: """
												# The cue command's behaviour when asked to export the contents of a package containing
												# only workflow command files:
												"""
										cmd:      "cue eval"
										exitCode: 1
										output: """
												build constraints exclude all CUE files in .:
												    some_tool.cue: _tool.cue files excluded in non-cmd mode

												"""
									}, {
										doc:      "# We symlink to a workflow command file using a non-workflow-command file name:"
										cmd:      "ln -s some_tool.cue debug.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# The cue command's behaviour now that the package contains a non-workflow-command file:"
										cmd:      "cue eval"
										exitCode: 0
										output: """
												name: "everyone"
												city: "Kinshasa"
												command: {
												    hello: {
												        print: {
												            $id: "tool/exec.Run"
												            cmd: "echo Hey everyone, welcome to Kinshasa!"
												            env: {} | []
												            stdout:      null
												            stderr:      null
												            stdin:       null
												            success:     bool
												            mustSucceed: true
												        }
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm -rf some_tool.cue debug.cue"
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
