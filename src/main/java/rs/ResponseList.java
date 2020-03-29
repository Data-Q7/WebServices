package rs;

import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import spr.objects.City;

@XmlRootElement(name = "citylist")
@XmlAccessorType(XmlAccessType.NONE)
public class ResponseList {

    public ResponseList() {
    }
    
    @XmlElement(name = "city")
    private List<City> list;

    
    public List<City> getList() {
        return list;
    }

    public void setList(List<City> list) {
        this.list = list;
    }
}