package site
{
	content: {
		docs: {
			howto: {
				"build-cue-api-java-jar": {
					page: {
						cache: {
							upload: {
								"HIDDEN: configure Maven download cache": "8fF83+zLRPuOkTiSWZnZPBEqFkc7NVXQGiWNdxoU41U="
								"test load":                              "H1atTxez1s5IMcMPIfrljT4YzbjnAhJMhzQH88Q+jog="
							}
							multi_step: {
								hash:       "9DPDHJ29H3MBTER99OJL9EFD3IR2ONNFVE82OTJ0DB2SQ7OJH2SG===="
								scriptHash: "D3P3UH58SHI11V1TRCCG8IUA6R9GR7J8MAFOVUOVTVDEO8T6MKEG===="
								steps: [{
									doc:      ""
									cmd:      "javac --version"
									exitCode: 0
									output: """
											javac 22.0.2

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "mvn --version"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "git --version"
									exitCode: 0
									output: """
											git version 2.39.5

											"""
								}, {
									doc:      ""
									cmd:      "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "git clone https://github.com/cue-lang/cue-api-java cue-api-java-source"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cd cue-api-java-source"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "git checkout 3c12bb9e9ea203d4de8308b4145e876e4b60207e"
									exitCode: 0
									output: """
											Note: switching to '3c12bb9e9ea203d4de8308b4145e876e4b60207e'.
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "mvn package"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "mv target/CUE*.jar CUE.jar"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "javac -cp CUE.jar TestLoad.java"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "java --enable-native-access=ALL-UNNAMED -cp CUE.jar:. TestLoad"
									exitCode: 0
									output: """
											CUE loaded successfully!

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
