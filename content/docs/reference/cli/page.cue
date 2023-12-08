package site

import (
	"path"
	"list"
	"strings"

	"github.com/cue-lang/cuelang.org/internal/ci"
	"github.com/cue-lang/cuelang.org/internal/ci/base"
	//"github.com/cue-lang/cuelang.org:site"
)

//cueVersion: site.versions.cue

let donotedit = base.doNotEditMessage & {#generatedBy: "content/docs/reference/cli/cli_tool.cue", _}

content: docs: reference: cli: {
	// cueBaseAddress must be aligned with the containing CUE address, as it is
	// baked in to templated page.cue files which live strictly underneath *this*
	// file's CUE address.
	cueBaseAddress: "content: docs: reference: cli"
	texts: {
		[CueCommand=string]: {
			cmd: *list.FlattenN(["cue", "help", strings.Split(CueCommand, "-")], 1) | [...string]
			contentDir: *"cue-\(CueCommand)" | string
			title:      *strings.Replace("cue-\(CueCommand)", "-", " ", -1) | string
		}
		version: {
		}
	}
	fs: ci.#writefs & {
		#os: path.OS | *path.Unix
		#texts: [!~" "]: {
			stdout!:     string // & !=""
			title?:      string
			contentDir?: string
			stderr?:     string // & ""
			...
		}

		Remove: [
			"cue-*", // relative to the cue-cmd invocation's working directory; which will be cli/ when invoked by go:generate
		]
		Create: {
			for text, output in fs.#texts {
				let _contentDir = output.contentDir
				let _title = output.title
				let _text = output.stdout & string
				let _markdownPath = path.Join([_contentDir, "en.md"], fs.#os)
				let _pageCuePath = path.Join([_contentDir, "page.cue"], fs.#os)
				(_markdownPath): {
					Contents: #"""
						---
						WARNING: \#(donotedit)
						title: \#(_title)
						tags:
						- cue command
						---
						
						```text
						\#(_text)
						```
						"""#
				}
				(_pageCuePath): {
					Contents: #"""
						package site
						
						\#(cueBaseAddress): "\#(_contentDir)": {}
						"""#
				}
			}
		}
	}
}
