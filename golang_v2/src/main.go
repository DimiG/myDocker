/**
 * ====================================================
 *  File: main.go
 *  Creator: Dmitri G.
 *  Date: 2019-07-17
 *  Description: This is a main file written in Golang
 * ====================================================
 */

package main

import (
	"io"
	"log"
	"net/http"
	"os"
)

func hello(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "Hello world from Docker!")
}

func main() {
	http.HandleFunc("/", hello)
	port := os.Getenv("PORT") // PaaS provides the port to bind to
	if port == "" {
		port = "8080"
	}

	log.Fatal(http.ListenAndServe(":"+port, nil))

}
