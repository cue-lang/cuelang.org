// Copyright 2023 The CUE Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package cmd

import (
	"github.com/spf13/cobra"
)

// newExecuteCmd creates a new execute command
//
// The directory structure of the cuelang.org repo (under the redesign
// for alpha.cuelang.org) is as follows:
//
//	.
//		├── content
//		├── hugo
//		│   ├── content
//		│   ├── ...
//		├── ...
//
// The execute command is responsible for taking human written content from
// /content, transforming it and writing it to /hugo/content. The latter
// directory, as the path suggests, is the source directory tree for hugo.
//
// Within /hugo/content we are following the approach of page bundles explained
// at https://gohugo.io/content-management/page-bundles/.
//
// Page bundles allow for content related to a page to be contained in a directory
// that also contains the page content. As the hugo docs describe, page bundles can
// either be nodes or leaves. The distinction is not significant for the description
// that follows.
//
// For example, if we want to define a URL:
//
//	https://alpha.cuelang.org/docs/howto/validate-yaml-using-cue
//
// one option would be to create the file:
//
//	/hugo/content/en/docs/howto/validate-yaml-using-cue.md
//
// Doing so however means that any images, static files etc related to that page
// have to be put somewhere common. This gets messy if all pages do that.
//
// Page bundles work differently by instead placing the content for that page in:
//
//	/hugo/content/en/docs/howto/validate-yaml-using-cue/index.md
//
// (the file is named _index.md for node bundles, and index.md for leaf bundles,
// per the hugo docs).
//
// Supporting images, files etc can then be placed within the containing directory:
//
//	/hugo/content/en/docs/howto/validate-yaml-using-cue/
//
// Using page bundles also allows us more flexibility in how we structure the
// /content directory.
//
// Note that using page bundles means the URL path now has a trailing slash:
//
//	https://alpha.cuelang.org/docs/howto/validate-yaml-using-cue/
//
// Notice that for translations the mapping between /hugo/content and the URL
// is slightly different:
//
//	/hugo/content/zh/docs/howto/validate-yaml-using-cue/ =>
//	  https://alpha.cuelang.org/zh-cn/docs/howto/validate-yaml-using-cue/
//
// Requiring /content to follow the same directory structure would be clumsy.
// It would mean we would have translations of the same page in different
// directory structures:
//
//	/content/en/docs/howto/validate-yaml-using-cue/
//	/content/zh/docs/howto/validate-yaml-using-cue/
//
// This is somewhat artificial and means that it would be harder to declare
// a CUE package that defines common configuration for a page and the guide
// it represents.
//
// Because we are using page bundles we can place translations in the same
// directory. Continuing the example from above, this would mean the following
// directory and file structure:
//
//	/content/docs/howto/validate-yaml-using-cue/en.md
//	/content/docs/howto/validate-yaml-using-cue/zh.md
//
// would get written to:
//
//	/hugo/content/en/docs/howto/validate-yaml-using-cue/index.md
//	/hugo/content/zh/docs/howto/validate-yaml-using-cue/index.md
//
// respectively.
//
// The execute command will observe rewriting _en.md to _index.md, and
// similarly en.md to index.md. If this results in conflicts etc, we rely on
// hugo to spot and report those problems.
//
// Following this approach, we can group all content, supporting files, language
// agnostic guide configuration etc in the directory:
//
//	/content/docs/howto/validate-yaml-using-cue/
//
// Root files mark a page root. Root files for a given language $LANG match the
// regular expression return by buildRootFileRegexp($LANG).
//
// The existence of at least one root file directory marks a page root. In the
// context of processing a page we will refer to this as the $SOURCE_DIR.
//
// A page root forms the basis of at least one translation. In the context of a
// given language, $TARGET_DIR refers to the target directory within the
// /hugo/content directory structure that corresponds to the page rooted at
// $SOURCE_DIR.
//
// After the transformation of each language markdown file, other files in the
// directory are copied to each target language directory. For example,
// continuing the example from above, if in addition to the en.md and de.md
// files we have:
//
//	/content/docs/howto/validate-yaml-using-cue/image.png
//
// then image.png is copied to the target language directories to leave:
//
//	/hugo/content/en/docs/howto/validate-yaml-using-cue/image.png
//	/hugo/content/zh/docs/howto/validate-yaml-using-cue/image.png
//
// Note this is not recursive. It only applies to the files in the page root
// directory.
//
// If the source directory contains a specially named directory _${LANG} then
// the contents of that directory and recursively copied to the correspond target
// directory.
func newExecuteCmd(c *Command) *cobra.Command {
	cmd := &cobra.Command{
		Use:   "execute",
		Short: "Generate /hugo/content from /content",
		RunE:  mkRunE(c, executeDef),
	}
	cmd.Flags().Bool(string(flagDebug), false, "turn on debug logging")
	cmd.Flags().StringP(string(flagDir), "d", "", "working directory. Defaults to the current working directory")
	cmd.Flags().BoolP(string(flagServe), "s", false, "watch the working directory for changes, executing on each batch of changes")
	cmd.Flags().BoolP(string(flagUpdate), "u", false, "update files in archives when formatting and running scripts")
	cmd.Flags().BoolP(string(flagNoRun), "r", false, "whether to attempt to run scripts or not")
	cmd.Flags().Bool(string(flagSkipCache), false, "skip cache checks; always run")
	return cmd
}
