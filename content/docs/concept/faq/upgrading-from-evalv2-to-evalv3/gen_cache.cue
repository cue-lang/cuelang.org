package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"upgrading-from-evalv2-to-evalv3": {
						page: {
							cache: {
								upload: {
									"main.go":                 "rz2hFo2CcSis7QVhnZxStIB41jxhLxX6CUWqNrrP1bU="
									"HIDDEN: required output": "0NpYhGblOcgDOHr4hzUQ4Rn6IlvNrPyPzjiC8x30mjU="
								}
								code: {
									"openinline: evalv2":                  "LwziGszp2EVuEKBaUoz8Ne2V0hOoVTlLmmWDW/prfDI="
									"openinline: evalv3: broken":          "r15J9W9/0ar+HIDJ/dTM+YO5A/LJv0Wxo53ci38CTQk="
									"openinline: evalv3: with openinline": "U4GuVTmuWN607fp0XnBXeuACsQNHEybmrCIQCydjTyQ="
								}
								multi_step: {
									hash:       "HEV0F8MOCECIIUDBU2JK481ERP0D9VQP1G7R3VQ0T1I0PVVVBI00===="
									scriptHash: "KA0TB7AGE97NH9M1904MEG37VEOGT5VOVI5IFBG76ARIOSFI0ECG===="
									steps: [{
										doc:      ""
										cmd:      "export GOMODCACHE=/caches/gomodcache"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "export GOCACHE=/caches/gobuild"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go mod init evalv3.example"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go mod tidy"
										exitCode: 0
										output: """
												...

												"""
									}, {
										doc:      ""
										cmd:      "go run main.go >output.got"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff output.want output.got"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.13.0-0.dev.0.20250305124614-153fc8a559ad
												...

												"""
									}, {
										doc:      ""
										cmd:      "go vet ./..."
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 0"
										cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
										exitCode: 0
										output: """
												...

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
