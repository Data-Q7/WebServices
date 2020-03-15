package extralessons.soup;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService(serviceName = "TestWS")
public class SoupServer {
    @WebMethod(operationName = "correctName")
    public String correctName(@WebParam(name = "name") String name){
        return "My name is " + name;
    }
}
