package extralessons.jaxp;

public class Start {
    
    public static void main(String[] args) {
        String xmlPath = "src/main/java/extralessons/jaxp/xml/people.xml";
        new DomParser().parse(xmlPath);
//        new SaxParser().parse(xmlPath);
//         new StaxParser().parse(xmlPath);
    }

}
