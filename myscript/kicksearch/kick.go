package main

import (
	"fmt"
	"io/ioutil"
	"os"

	"log"
	//"regexp"
	"strings"
	"github.com/PuerkitoBio/goquery"
)


//fmt.Printf("%s:-:%s:-:%s\n", linkText.Text(),andLink,andSize.Text())
func main() {
var s[]string
	data, err := ioutil.ReadFile(os.Args[1])
	if err != nil {
		log.Fatal(err)
	}
	doc, err := goquery.NewDocumentFromReader(strings.NewReader(string(data)))
	if err != nil {
		log.Fatal(err)
	}
	doc.Find("tbody tr ").Each(func(i int, tag *goquery.Selection) {
		// For each item found, get the title
		//link, _ := tag.Attr("href")
		//linkText := tag.Text()
		linkText := tag.Find("a.cellMainLink")
		andLink,_ := linkText.Attr("href")   // for Attr you need to add err handler
		andSize := tag.Find("td.nobr")
		andUploadtime := tag.Find("td[title]")

		//fmt.Printf("%s:-:%s:-:%s:-:%s\n", linkText.Text(),andLink,strings.Replace(andSize.Text(),"\n","",-1),strings.Replace(andUploadtime.Text(),"\n","",-1))
		result :=  linkText.Text()+":-:" +andLink+ ":-:"+  strings.Replace(andSize.Text(),"\n","",-1)+ ":-:"+strings.Replace(andUploadtime.Text(),"\n","",-1)
		s = append(s,result)

		//fmt.Printf("%s:-:%s:-:%s:-:%s\n", linkText.Text(),andLink,andSize.Text(),andUploadtime.Text())
	})
	for i:=3;i<len(s);i++{
		if s[i] == "" {
			break
		}			
		fmt.Print(s[i])
	}



	

}
