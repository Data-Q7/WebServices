package spr.objects;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import ws.annotations.ExceptionMessage;

@XmlAccessorType(XmlAccessType.FIELD)
@ExceptionMessage(message = "Укажите город")
public class City {

    @XmlElement(required = true)
    @ExceptionMessage(message = "Не указан id города")
    private long id;
    private String name;    
    private String desc;
    private Country country;
    private String code;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    
    

  
}
