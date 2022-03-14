package main 
import (
	"fmt"
"os"
	"io/ioutil"
	"strings"
	//	"regexp"
	"github.com/PuerkitoBio/goquery"
)
func main() {
	data ,err := ioutil.ReadFile(os.Args[1])
	if err != nil {
		return
	}
	doc, err := goquery.NewDocumentFromReader(strings.NewReader(string(data)    ))

	if err != nil {
		return
	}
	link := doc.Find("a.siteButton.giantButton")
	andLink , _ := link.Attr("href")
	fmt.Println(andLink)
}
