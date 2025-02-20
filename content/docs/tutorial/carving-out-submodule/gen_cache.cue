package site
{
	content: {
		docs: {
			tutorial: {
				"carving-out-submodule": {
					page: {
						cache: {
							upload: {
								"mod 1 initial content": "T5Xe6ULwA4G1Fkd9V7Xs0982L3vcJOJxQda6FNJ+yrA="
								"main initial content":  "W+VBQ08SWJR25bUstgxNNdUsd+OjbhxAxFg+fFfIiRQ="
							}
							multi_step: {
								hash:       "GLIJ06U29UN30BDVAUL8UDJ778E3KM0BB5ND71C19L5P2GTDB0AG===="
								scriptHash: "3OHHT87C1F5GIB9UM4R7OB29VK6OK5PC1R9QQRDS2N5KUSDHGGL0===="
								steps: [{
									doc:      ""
									cmd:      "git config --global user.email 'cueckoo@cue.works'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git config --global user.name cueckoo"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mkdir -p $HOME/.config/cue"
									exitCode: 0
									output:   ""
								}, {
									doc: ""
									cmd: """
											cat <<EOD >$HOME/.config/cue/logins.json
											{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_COLLABORATOR_RW}","token_type":"Bearer"}}}
											EOD
											"""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mkdir mod1 main"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd mod1"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init --source=self github.com/cueckoo/mod1"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod publish v0.0.1"
									exitCode: 0
									output: """
											published github.com/cueckoo/mod1@v0.0.1 to registry.cue.works/github.com/cueckoo/mod1:v0.0.1

											"""
								}, {
									doc:      ""
									cmd:      "cd ../main"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init cue.example/main"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat cue.mod/module.cue"
									exitCode: 0
									output: """
											module: "cue.example/main"
											language: {
											\tversion: "v0.12.0"
											}
											deps: {
											\t"github.com/cueckoo/mod1@v0": {
											\t\tv:       "v0.0.1"
											\t\tdefault: true
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "X": "hello world"
											}

											"""
								}, {
									doc:      ""
									cmd:      "cd ../mod1"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# Move to cue subdirectory"
									cmd:      "cd cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init --source=self github.com/cueckoo/mod1/cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod publish v0.0.1"
									exitCode: 0
									output: """
											published github.com/cueckoo/mod1/cue@v0.0.1 to registry.cue.works/github.com/cueckoo/mod1/cue:v0.0.1

											"""
								}, {
									doc:      ""
									cmd:      "cd ../../main"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# remove cue.mod directory and re-init as clean way to remove
											# all declared depdendencies
											"""
									cmd:      "rm -r cue.mod"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init cue.example/main"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# This should now fail because we have the latest versions of
											# the original root-level module and the submodule providing
											# the same package
											"""
									cmd:      "cue mod tidy"
									exitCode: 1
									output: """
											failed to resolve "github.com/cueckoo/mod1/cue/schema": ambiguous import: found package github.com/cueckoo/mod1/cue/schema in multiple modules:
											\tgithub.com/cueckoo/mod1@v0 v0.0.1 (cue/schema)
											\tgithub.com/cueckoo/mod1/cue@v0 v0.0.1 (schema)

											"""
								}, {
									doc:      ""
									cmd:      "cd ../mod1"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod publish v0.0.2"
									exitCode: 0
									output: """
											published github.com/cueckoo/mod1@v0.0.2 to registry.cue.works/github.com/cueckoo/mod1:v0.0.2

											"""
								}, {
									doc:      ""
									cmd:      "cd ../main"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# remove cue.mod directory and re-init as clean way to remove
											# all declared depdendencies
											"""
									cmd:      "rm -r cue.mod"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init cue.example/main"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# This should now work again"
									cmd:      "cue mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat cue.mod/module.cue"
									exitCode: 0
									output: """
											module: "cue.example/main"
											language: {
											\tversion: "v0.12.0"
											}
											deps: {
											\t"github.com/cueckoo/mod1/cue@v0": {
											\t\tv:       "v0.0.1"
											\t\tdefault: true
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "X": "hello world"
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
