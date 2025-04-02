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
									"schema-v0.0.1": "swL+MCzq1sdXS9kvht/jx5WGn+nN1OtpHjvx/+27PjE="
									"config.cue":    "m5KtuWF10ip2gUQ6WsXEtLrEWERQg6nZlpFTfiZsRdY="
								}
								multi_step: {
									hash:       "BOIM77CUHNQ961OSJ2KKE5KNRMJ3N0NEK93ELFV7CJABC92DTS0G===="
									scriptHash: "KJPTVSIJNO42KBQN3ATSSD3IEU9FNQKH8J0R3LTVFG9E9ND253S0===="
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
										doc:      "# Opt in to CUE prerelease, for consistency with other CLDD pages."
										cmd:      "export PATH=/cues/v0.13.0-alpha.3:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-alpha.3
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
												\tversion: "v0.13.0"
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
