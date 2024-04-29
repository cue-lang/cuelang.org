package site
{
	content: {
		docs: {
			tutorial: {
				"publishing-modules-to-the-central-registry": {
					page: {
						cache: {
							upload: {
								"schema-v0.0.1": "X6eFOT7CQPn5hJfPTnHaTdxR7DnSE/A8Vm9iLR2NfA8="
								"config.cue":    "m9EeEjLRmlrOF2hLjRoMvpDWVAE/GMnhCRxVU2zZ5Xg="
							}
							multi_step: {
								hash:       "KM6JUD68OANQFGA1PERT968ED8BE3PGDC0PUFLA7QR4P2KM1JSV0===="
								scriptHash: "93MAHHR2NODMUHNHIQTQJEP46MI7S4OKG4RACCM2HC9RT04PS8UG===="
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
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.3
											...

											"""
								}, {
									doc:      ""
									cmd:      "mkdir frostyconfig"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd frostyconfig"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export CUE_EXPERIMENT=modules"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git init -q"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# Replace \"cueckoo\" with *your* GitHub username, lower-cased."
									cmd:      "cue mod init --source=git github.com/cueckoo/frostyconfig@v0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git add -A"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git commit -q -m 'Initial commit'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod publish v0.0.1"
									exitCode: 0
									output: """
											published github.com/cueckoo/frostyconfig@v0.0.1

											"""
								}, {
									doc:      ""
									cmd:      "mkdir ../frostyapp"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd ../frostyapp"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git init -q"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init --source=git github.com/cueckoo/frostyapp@v0"
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
											module: "github.com/cueckoo/frostyapp@v0"
											language: {
											\tversion: "v0.9.0-alpha.3"
											}
											source: {
											\tkind: "git"
											}
											deps: {
											\t"github.com/cueckoo/frostyconfig@v0": {
											\t\tv: "v0.0.1"
											\t}
											}

											"""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											config:
											  appName: alpha
											  port: 80
											  features:
											    logging: true

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
