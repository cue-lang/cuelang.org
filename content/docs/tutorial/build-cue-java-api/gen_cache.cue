package site
{
	content: {
		docs: {
			tutorial: {
				"build-cue-java-api": {
					page: {
						cache: {
							multi_step: {
								"SOFG8OF6QKPDVE3FNK8SAD15BI2ONQDGGCMFQJO8K6C4CH1KBDE0====": [{
									doc:      ""
									cmd:      "export MAVEN_ARGS=\"-B\""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export TERM=\"dumb\""
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go version"
									exitCode: 0
									output: """
											go version go1.22.1 linux/amd64

											"""
								}, {
									doc:      ""
									cmd:      "go env CGO_ENABLED"
									exitCode: 0
									output: """
											1

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cc -v 2>&1 | sed -n '/ version /p'"
									exitCode: 0
									output: """
											gcc version 12.2.0 (Debian 12.2.0-14) 
											...

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "java --version"
									exitCode: 0
									output: """
											openjdk 22 2024-03-19
											...

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "mvn -v"
									exitCode: 0
									output: """
											\u001b[1mApache Maven 3.8.7\u001b[m
											...

											"""
								}, {
									doc:      ""
									cmd:      "git -v"
									exitCode: 0
									output: """
											git version 2.39.2

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "git clone https://github.com/cue-lang/libcue.git"
									exitCode: 0
									output: """
											Cloning into 'libcue'...
											...

											"""
								}, {
									doc:      ""
									cmd:      "cd libcue"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go build -o libcue.so -buildmode=c-shared"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "export LD_LIBRARY_PATH=$(readlink -f .)"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd $HOME"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "git clone https://github.com/cue-lang/cue-api-java.git"
									exitCode: 0
									output: """
											Cloning into 'cue-api-java'...
											...

											"""
								}, {
									doc:      ""
									cmd:      "cd cue-api-java"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "mvn package"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "ls -l target/*.jar"
									exitCode: 0
									output: """
											-rw-rw-rw- 1 runner dialout 97771 Apr 10 15:30 target/CUE-0.0-devel.jar

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
