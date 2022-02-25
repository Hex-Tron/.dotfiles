package main
import 	"fmt"
import 	"github.com/antchfx/xmlquery"
import "strings"
import "os"
import "strconv"

var p = fmt.Print
func getTarget (xml  , y string ) {
//	fmt.Print(xml)
	sp, err := xmlquery.CreateStreamParser(strings.NewReader(xml), y)
	if err != nil {
		panic(err)
	}
	for 
	{
		n, err := sp.Read()
		if err != nil {
			break
		}
		fmt.Print(n.InnerText())
	}
}
func getTarget2 (xml ,y string)  {
	//p(xml)
	value := strings.Split(xml, y)[1]
	valuechange :=strings.Split(value,"<")[0]
	 i, err := strconv.Atoi(valuechange)
    if err != nil {
        // handle error
        fmt.Println(err)
        os.Exit(2)
    }
    fmt.Print((i/1024)/1024,  "MB:-:")
	
	

//	p(	strings.Split(value, "<")[0],":-:")





}
func main() {
	f, err := os.Open("/home/hextron/.cache/torrent/New.xml")
	//	doc, err := xmlquery.Parse(f)
	if err != nil {
		panic(err)
	}
	//	channel := xmlquery.FindOne(doc, "//channel")
	//	if n := channel.SelectElement("title"); n != nil {
	//		fmt.Printf("title: %s\n", n.InnerText())
	//	}
	//	if n := channel.SelectElement("link"); n != nil {
	//		fmt.Printf("link: %s\n", n.InnerText())
	//	}
	//	for  n := range xmlquery.Find(doc, "//item") {
	//	//fmt.Printf("#%d %s\n", i, n.InnerText())
	//	fmt.Printf('%s \n' ,n )
	p, err := xmlquery.CreateStreamParser(f, "//item")
	for 
	{
		n, err := p.Read()
		if err != nil {
			break
		}
		//		fmt.Println(n.OutputXML(true), "\n")
		sp, err := xmlquery.CreateStreamParser(strings.NewReader(n.OutputXML(true)), "//title")
		if err != nil {
			panic(err)
		}
		for 
		{
			n, err := sp.Read()
			if err != nil {
				break
			}
			input := string(n.InnerText())
			fmt.Print(strings.Replace( input , "\n", " " , -1), ":-:")
			//			fmt.Println(input)
		}
		test := string(n.OutputXML(true))
		getTarget2(test,"contentLength>")
		getTarget(test,"//item/pubDate") //working
		fmt.Print(":-:")
		getTarget(test,"//item/link") //working



		fmt.Println()
	}
}
