module github.com/cue-lang/cuelang.org

go 1.24.0

require (
	cuelang.org/go v0.15.3
	github.com/apex/gateway v1.1.2
	github.com/aws/aws-lambda-go v1.32.1
	github.com/fsnotify/fsnotify v1.6.0
	github.com/go-quicktest/qt v1.101.0
	github.com/rogpeppe/go-internal v1.14.1
	github.com/rogpeppe/testscript v1.1.0
	github.com/spf13/cobra v1.10.1
	golang.org/x/mod v0.29.0
	golang.org/x/oauth2 v0.32.0
	golang.org/x/sync v0.17.0
	golang.org/x/text v0.30.0
	golang.org/x/tools v0.38.0
	mvdan.cc/sh/v3 v3.7.0
)

require (
	cuelabs.dev/go/oci/ociregistry v0.0.0-20250722084951-074d06050084 // indirect
	github.com/BurntSushi/toml v1.4.1-0.20240526193622-a339e1f7089c // indirect
	github.com/cockroachdb/apd/v3 v3.2.1 // indirect
	github.com/emicklei/proto v1.14.2 // indirect
	github.com/google/go-cmp v0.7.0 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/kr/pretty v0.3.1 // indirect
	github.com/kr/text v0.2.0 // indirect
	github.com/mitchellh/go-wordwrap v1.0.1 // indirect
	github.com/opencontainers/go-digest v1.0.0 // indirect
	github.com/opencontainers/image-spec v1.1.1 // indirect
	github.com/pelletier/go-toml/v2 v2.2.4 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/protocolbuffers/txtpbfmt v0.0.0-20251016062345-16587c79cd91 // indirect
	github.com/spf13/pflag v1.0.10 // indirect
	github.com/tetratelabs/wazero v1.9.0 // indirect
	go.yaml.in/yaml/v3 v3.0.4 // indirect
	golang.org/x/exp/typeparams v0.0.0-20231108232855-2478ac86f678 // indirect
	golang.org/x/net v0.46.0 // indirect
	golang.org/x/sys v0.37.0 // indirect
	golang.org/x/tools/go/expect v0.1.1-deprecated // indirect
	google.golang.org/protobuf v1.33.0 // indirect
	honnef.co/go/tools v0.6.1 // indirect
)

tool (
	cuelang.org/go/cmd/cue
	honnef.co/go/tools/cmd/staticcheck
)
