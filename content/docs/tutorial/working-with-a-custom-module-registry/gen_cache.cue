package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-a-custom-module-registry": {
					page: {
						cache: {
							upload: {
								"schema-v0.0.1":            "G/FDeQM7vKk4BIRRv1hD35sfc1gjNZAXQjNceWWecQE="
								"config.cue":               "Oyk24GKJmXVgUm11ebT6rGXAuq7FLOoDOtLRXIMWUtA="
								"second-module-to-publish": "SC0QcevU6pJ/azhR5KEIWxRTzPp7VxzwMhJG5l5l6Xs="
								"update-frostyapp":         "40mH5bW59UPjH9cgTojXkLZK8dVCc+B2MHztDWohNBc="
								"schema-v0.1.0":            "+/jyEBZC+fhcq6oAR3M9V9x5vxiOpeuKmthDF3xo0aE="
							}
							multi_step: {
								hash:       "UBVHOG6KQ90C30HEK3VHO5RCH8HFUTPM78VEBKH3HBA2AU8B9I10===="
								scriptHash: "MHNUU8GT0EEGLQCV7OVKG62H1EG7POGJ8ANFSN43U1OTV4QH2F3G===="
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
									doc: """
											# TODO: this is inherently racey. But not a problem in practice...
											# for now. When it does become a problem we can solve this properly
											# using a nc-based wait loop or similar.
											"""
									cmd:      "nohup cue mod registry localhost:5001 >/tmp/cue_mod_registry 2>&1 &"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.0-rc.1.0.20260314205741-820e1530e9ff
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
									doc:      ""
									cmd:      "cue mod init --source=git glacial-tech.example/frostyconfig@v0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export CUE_REGISTRY=localhost:5001/cuemodules"
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
									cmd:      "cue mod init --source=git glacial-tech.example/frostyapp@v0"
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
											module: "glacial-tech.example/frostyapp@v0"
											language: {
											\tversion: "v0.16.0"
											}
											source: {
											\tkind: "git"
											}
											deps: {
											\t"glacial-tech.example/frostyconfig@v0": {
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
								}, {
									doc:      ""
									cmd:      "mkdir ../frostytemplate"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd ../frostytemplate"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git init -q"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init --source=git glacial-tech.example/frostytemplate@v0"
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
									cmd:      "cd ../frostyapp"
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
											module: "glacial-tech.example/frostyapp@v0"
											language: {
											\tversion: "v0.16.0"
											}
											source: {
											\tkind: "git"
											}
											deps: {
											\t"glacial-tech.example/frostyconfig@v0": {
											\t\tv: "v0.0.1"
											\t}
											\t"glacial-tech.example/frostytemplate@v0": {
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
											  debug: false
											  features:
											    logging: true
											    analytics: true

											"""
								}, {
									doc:      ""
									cmd:      "cd ../frostyconfig"
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
									cmd:      "git commit -q -m 'Second commit'"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "cue mod publish v0.1.0"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cd ../frostyapp"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod get glacial-tech.example/frostyconfig@v0.1.0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											config:
											  appName: alpha
											  port: 80
											  debug: false
											  features:
											    logging: true
											    analytics: true

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
