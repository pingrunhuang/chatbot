package webapp

import (
	"fmt"
	"html/template"
	"net/http"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseFiles("webapp/template/index.html")
	if err != nil {
		panic(fmt.Errorf("Error parsing the template %v", err))
	}
	t.Execute(w, nil)
}

// Launch method is the start point of the webapp
func Launch() {
	http.HandleFunc("/", indexHandler)
	http.ListenAndServe(":1234", nil)
}
