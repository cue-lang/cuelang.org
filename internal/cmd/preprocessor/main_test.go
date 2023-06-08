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

package main

import (
	"bytes"
	"context"
	"errors"
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"testing"
	"time"

	"golang.org/x/sync/errgroup"
)

// Ensure that we can run the default serve script to render the homepage
func TestServeScript(t *testing.T) {
	ctx, done := context.WithCancel(context.Background())
	wg, ctx := errgroup.WithContext(ctx)

	var buf bytes.Buffer

	cwd, _ := os.Getwd()
	cmd := exec.CommandContext(ctx, "./_scripts/serve.bash", "--debug=all")
	cmd.Cancel = func() error {
		return cmd.Process.Signal(os.Interrupt)
	}
	cmd.Stdout = &buf
	cmd.Stderr = &buf
	cmd.Dir = filepath.Join(cwd, "..", "..", "..")

	// Run serve
	wg.Go(func() error {
		if err := cmd.Start(); err != nil {
			return fmt.Errorf("serve failed to start: %v", err)
		}
		if err := cmd.Wait(); err != nil && !errors.Is(err, context.Canceled) {
			return fmt.Errorf("serve failed to wait for command: %v\n%s", err, buf.Bytes())
		}
		return nil
	})

	// Run check
	wg.Go(func() error {
		defer done()
		deadline, ok := t.Deadline()
		tick := time.NewTicker(time.Second)
		for {
			if ok && deadline.Sub(time.Now()) < 2*time.Second {
				return fmt.Errorf("timed out trying to fetch")
			}
			select {
			case <-tick.C:
				resp, err := http.Get("http://127.0.0.1:1313/docs/")
				if err != nil {
					// Server not ready yet.
					continue
				}
				// server is up and running
				defer resp.Body.Close()
				body, err := io.ReadAll(resp.Body)
				if err != nil {
					return fmt.Errorf("failed to read response body: %v", err)
				}
				if !bytes.Contains(body, []byte("Welcome to CUE")) {
					return fmt.Errorf("body did not contain expected value:\n%s", body)
				}
				tick.Stop()
				return nil
			case <-ctx.Done():
				// The serve command failed/other before we successfully
				// GET-ed the page.
				return nil
			}
		}
	})

	if err := wg.Wait(); err != nil {
		t.Fatalf("failed: %v\n%s", err, buf.Bytes())
	}
}
