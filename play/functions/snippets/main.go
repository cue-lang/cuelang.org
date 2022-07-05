// Copyright 2020 The CUE Authors
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

package main

import (
	"fmt"
	"io"
	"net/http"
)

const userAgent = "cuelang.org/play/ playground snippet fetcher"

func handle(w http.ResponseWriter, r *http.Request) {
	cors(w)
	f := func(format string, args ...interface{}) {
		fmt.Fprintf(w, format, args...)
	}
	client := &http.Client{}
	if r.Method == "POST" {
		// Share
		url := fmt.Sprintf("https://play.golang.org/share")
		req, err := http.NewRequest("POST", url, nil)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			f("Failed to create onwards GET URL: %v", err)
			return
		}
		req.Header.Add("User-Agent", userAgent)
		req.Body = r.Body
		resp, err := client.Do(req)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			f("Failed in onward request: %v", err)
			return
		}
		io.Copy(w, resp.Body)
	} else {
		// Retrieve via the parameter id
		url := fmt.Sprintf("https://play.golang.org/p/%v.go", r.FormValue("id"))
		req, err := http.NewRequest("GET", url, nil)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			f("Failed to create onwards GET URL: %v", err)
			return
		}
		req.Header.Add("User-Agent", userAgent)
		resp, err := client.Do(req)
		if err != nil {
			w.WriteHeader(http.StatusInternalServerError)
			f("Failed in onward request: %v", err)
			return
		}
		io.Copy(w, resp.Body)
	}
}

func main() {
	http.HandleFunc("/.netlify/functions/snippets", handle)
	serve()
}
