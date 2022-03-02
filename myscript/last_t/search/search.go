package main

import 	"fmt"
//import "github.com/antchfx/xmlquery"
import "github.com/antchfx/htmlquery"
//import "reflect"
import "strings"
//import "os"
//import "strconv"

//import 	"github.com/ericchiang/css"
//import 	"golang.org/x/net/html"

func main() {
	p := fmt.Print
	filePath := "/home/hextron/.cache/torrent/check.html"
	var title []string
	var link []string
	var upload []string
	doc, err := htmlquery.LoadDoc(filePath)

	if err != nil {
		panic(err)
	}
	//list := htmlquery.Find(doc, "//a/@href")	
	//for _ , n := range list{
	//	fmt.Println(htmlquery.SelectAttr(n, "href")) // output @href value
	//}
	list, err := htmlquery.QueryAll(doc, "//td")
	if err != nil {
		panic(err)
	}
	for _, n := range list {
		a := htmlquery.FindOne(n, "//div/a")
		if a != nil {
		//	fmt.Printf("%d %s :-:", i, htmlquery.InnerText(a),":-:\n")
	//	fmt.Print(i)
			title = append(title, htmlquery.InnerText(a))
		}

	}
	list1 := htmlquery.Find(doc, "//a/@href")
	for _ , n := range list1{
		if strings.HasPrefix(htmlquery.SelectAttr(n,"href"),"magnet") {
			//fmt.Println(htmlquery.SelectAttr(n, "href")) // output @href value
			link=append(link,htmlquery.SelectAttr(n,"href"))
		}
	}
	

	//fmt.Println(len(title))
	//fmt.Println(len(link))


	list2 := htmlquery.Find(doc, "//td/font")
	for _ , n := range list2{
		if strings.HasPrefix(htmlquery.SelectAttr(n,"class"),"det") {

			//fmt.Println(htmlquery.InnerText(n)) // output @href value
			newvalue := strings.Split(htmlquery.InnerText(n),",")
			newvalue2 := ":-:" + newvalue[0] + ":-:" + newvalue[1] + ":-:"
			//p(newvalue2 , "\n")
			upload = append(upload, newvalue2)

			//link=append(link,htmlquery.SelectAttr(n,"href"))
		}
	}
	
	p(len(title))
	p(len(link))

	if len(title)==len(link) {
		for i := range title {
			p(title[i],upload[i],link[i],"\n")
		}


	}
	
	// list1, err := htmlquery.QueryAll(doc, "//td/a/@alt")
	// if err != nil {
	// 	panic(err)
	// }
	// for i1, n1 := range list1 {
	// 	a1 := htmlquery.FindOne(n1, "//a")
	// 	if a1 != nil {
	// 		fmt.Printf("%d %s :-:", i1, htmlquery.SelectAttr(a1,"alt"),":-:\n")
	// 	} else {
	// 		fmt.Println("null")
	// 	}

	// }

}
