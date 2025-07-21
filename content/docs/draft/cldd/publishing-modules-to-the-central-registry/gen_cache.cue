package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"publishing-modules-to-the-central-registry": {
						page: {
							cache: {
								upload: {
									"schema-v0.0.1": "cAhJBZfjNDTO+NJyejwpTTDpcxe/E5cwSlUPFJpRIYc="
									"config.cue":    "81ImziFipAAF86rww8GOSNWHAEqIH7p91lkt5nEZh/Y="
								}
								multi_step: {
									hash:       "SSRAOTAK5884Q1PIBJS00PC4F5856HO8PU19D78SBCHH2BAHH950===="
									scriptHash: "JHP3LU89JJU18OTK4RDNQ1EAJVDUO2E7GM3JNCB653S5V0GOT6NG===="
									steps: [{
										doc:      "# Git config."
										cmd:      "git config --global user.email 'cueckoo@cue.works'"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "git config --global user.name cueckoo"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# Access to Central Registry."
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
												cue version v0.13.2
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
										doc:      "#ellipsis 0"
										cmd:      "cue mod publish v0.0.1"
										exitCode: 0
										output: """
												...

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
												\tversion: "v0.13.2"
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
}
