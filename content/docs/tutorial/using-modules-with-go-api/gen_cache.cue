package site
{
	content: {
		docs: {
			tutorial: {
				"using-modules-with-go-api": {
					page: {
						cache: {
							upload: {
								"person module": "vTwNgBSH/JRec3FBquvtoDtoFgcD8v1MoFNhegBZahM="
								"person schema": "tvaCZfdJp0obTnYrF9DMnXgdzJy/UN9TYjv4jCxP4Lo="
								"main cue file": "MOuzHD2WTFwWOTsommadtkHpjp/3QXmJ1IuyW9Zd6Bs="
								"main go file":  "1imUlxzHk1A1u3c57qngwsl8FiU4Gnu4QtiSNOrBa2E="
							}
							multi_step: {
								"89E2PH5CSIKRQUS9MJBUREPVODFGV74FFEKDEK9N6J2TM41SVF10====": [{
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
									cmd:      "go get cuelang.org/go@v0.8.0-alpha.4"
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
