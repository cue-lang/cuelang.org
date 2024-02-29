package site
{
	content: {
		docs: {
			tutorial: {
				"using-modules-with-go-api": {
					page: {
						cache: {
							upload: {
								"person module": "IituC6TTCHJb5FLIRPbzLPYR/lJG773oaLb+dPhApfs="
								"person schema": "P54+bS1QHuZYzB18h+7dqmS9ljg2V2uK2OnJ20zq6P8="
								"main cue file": "SGTcSiRfOwIrY8gKO9GMpVQFqhemYEXqrLQAw0hwcVw="
								"main go file":  "CTbFzw/HXt66CB4wQXTw+YHIuiBAsnhiL+u/tJMuqvc="
							}
							multi_step: {
								"EIH0AHLB2LRJ8S9T364RR4059QF3P11GDC0E9OKHGI24HERM1440====": [{
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
									doc: """
											# TODO: this is inherently racey. But not a problem in practice...
											# for now. When it does become a problem we can solve this properly
											# using a nc-based wait loop or similar.
											"""
									cmd:      "nohup cue mod registry localhost:5000 >/tmp/cue_mod_registry 2>&1 &"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "sleep 0.5"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export CUE_EXPERIMENT=modules"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export CUE_REGISTRY=localhost:5000"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd $HOME/.person"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod publish v0.1.0"
									exitCode: 0
									output: """
											published schemas.example/person@v0.1.0

											"""
								}, {
									doc:      ""
									cmd:      "cd $HOME"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "unset CUE_EXPERIMENT"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init our.example/mod@v0"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export CUE_EXPERIMENT=modules"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod tidy"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export"
									exitCode: 0
									output: """
											{
											    "p": {
											        "name": "cueckoo",
											        "age": 99
											    }
											}

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init our.example/mod"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.9.0-alpha.1"
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
									cmd:      "go run ."
									exitCode: 0
									output: """
											p.name: "cueckoo"

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
