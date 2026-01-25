package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-a-custom-module-registry": {
					page: {
						cache: {
							upload: {
								"schema-v0.0.1":            "oEjba2XaLj2M/DfTK5Wn2sBymWfDNBl8cqETAYI29n4="
								"config.cue":               "6SHI4X4XTxPUChhmoYo9aAnpfP6GgWVwmJwhQ/IUBho="
								"second-module-to-publish": "RHODN49MakI90kC2tYzsCxZqIeMR4mhIpV/NmOBimt8="
								"update-frostyapp":         "py3YrWLazbH/NKxiUjdMr0RmdL5g/r31pnCNfl3AeTQ="
								"schema-v0.1.0":            "/1Yc6k5RJZmpI6KH+vpF1av/y0ove4XP8Zi2GHYhAlw="
							}
							multi_step: {
								hash:       "NH4VL32M32VNG7PE0ID1UJMRNKDGC8RFB6JBM56CEVBJ0BTLO8QG===="
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
											cue version v0.15.3
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
											\tversion: "v0.15.3"
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
											\tversion: "v0.15.3"
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
