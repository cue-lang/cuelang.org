package site
{
	content: {
		docs: {
			draft: {
				"cbe-005_gitlab_ci": {
					page: {
						cache: {
							upload: {
								"4":  "aLtxdQv2V1TDC0+f26NijQ1pFDsZqVGPeKOSrdz/+Mg="
								"5":  "L1jMWjzEOCQ+3DaIeP8vhZ+DIIWnvLy+FqWvfJggaso="
								"10": "D85gfFT3U3ZT4FpG6w7iAoK/kch5wzrI8Bj9+nUe98g="
								"11": "GUKBqSRmaxz2i7auAbpdvkJE4OBzcS4Y2GK4Ynf8vno="
								"12": "2zYOXOuxnEUl9uOL0DjFpNnlFRTj9QoJSchkzXcPs18="
								"14": "SU9dn9KlFBYOri2f4j1cYJlND950HKyODf+y2dssMgw="
							}
							multi_step: {
								hash:       "7AB12II9JIIVPECPNPOJQ5P6D945HURB5VNK8VMT483FFRV7RKLG===="
								scriptHash: "9GOVSC02MRTRRI2J2D16DARV432R11BI0PII3E67QVL7RERCQR2G===="
								steps: [{
									doc:      "# Set up example content as a git repo."
									cmd:      "cd gitlab"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "git init ."
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "git config user.email cuelang.org@cue.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git config user.name cuelang.org"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git add . -v"
									exitCode: 0
									output: """
											add '.gitlab-ci.yml'

											"""
								}, {
									doc:      ""
									cmd:      "git commit -m \"Initial commit\" >/dev/null"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd .."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd gitlab # our example repository"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git status # should report \"working tree clean\""
									exitCode: 0
									output: """
											On branch master
											nothing to commit, working tree clean

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init gitlab.com/gitlab-org/gitlab"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import .gitlab-ci.yml --with-context -p gitlab -f -l pipelines: -l 'strings.TrimSuffix(path.Base(filename),path.Ext(filename))' -o gitlab-ci.cue"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# ls {,.}*gitlab-ci*
											"""
									cmd:      "ls {,.}*gitlab-ci* >../4.expected.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../4.expected.txt ../4.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# head -9 gitlab-ci.cue
											"""
									cmd:      "head -9 gitlab-ci.cue >../5.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff --side ../5.expected.txt ../5.actual.txt"
									exitCode: 0
									output: """
											package gitlab\t\t\t\t\t\t\tpackage gitlab

											pipelines: ".gitlab-ci": {\t\t\t\t\tpipelines: ".gitlab-ci": {
											\tstages: [\t\t\t\t\t\t\tstages: [
											\t\t"sync",\t\t\t\t\t\t\t\t"sync",
											\t\t"preflight",\t\t\t\t\t\t\t"preflight",
											\t\t"prepare",\t\t\t\t\t\t\t"prepare",
											\t\t"build-images",\t\t\t\t\t\t\t"build-images",
											\t\t"fixtures",\t\t\t\t\t\t\t"fixtures",

											"""
								}, {
									doc:      ""
									cmd:      "mkdir -p internal/ci/gitlab"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv gitlab-ci.cue internal/ci/gitlab"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "curl -sSo internal/ci/gitlab/gitlab.cicd.pipeline.schema.json https://gitlab.com/gitlab-org/gitlab/-/raw/277c9f6b643c92d00101aca0f2b4b874a144f7c5/app/assets/javascripts/editor/schema/ci.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import -p gitlab -l '#Pipeline:' internal/ci/gitlab/gitlab.cicd.pipeline.schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c ./internal/ci/gitlab"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd $(git rev-parse --show-toplevel) # make sure we're sitting at the repository root"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue help cmd regenerate ./internal/ci/gitlab   # the "./" prefix is required
											"""
									cmd:      "cue help cmd regenerate ./internal/ci/gitlab | head -4 >../12.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff ../12.expected.txt ../12.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue cmd regenerate ./internal/ci/gitlab # the \"./\" prefix is required"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# 2 commands not present in CUE-By-Example guide, added as an attempt to work
											# around cue-lang/cue#3492. DELETE THESE COMMANDS!
											"""
									cmd:      "sleep 1"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "sync"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# git diff .gitlab-ci.yml
											# For some unknown reason the trailing '>../...' redirection *only* works when
											# the diff command is given a '--' separator. I'm utterly stumped, but let's
											# just give it what it wants!
											"""
									cmd:      "git diff -- .gitlab-ci.yml | grep -vE '^index [0-9a-f]{7}\\.\\.[0-9a-f]{7}' | head -9 >../14.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "git add .gitlab-ci.yml internal/ci/gitlab/ cue.mod/module.cue"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# Actual command in CUE-By-Example guide:
											# git commit -m "ci: create CUE sources for GitLab CI/CD pipelines"
											"""
									cmd:      "git commit --quiet -m \"ci: create CUE sources for GitLab CI/CD pipelines\""
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
