package interfaces.sei;

import java.util.ArrayList;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;
import javax.jws.soap.SOAPBinding.Use;
import javax.xml.bind.annotation.XmlElement;
import objects.Flight;
import objects.Passenger;
import objects.Reservation;
import spr.objects.City;
import spr.objects.Place;
import ws.exceptions.ArgumentException;



@WebService(name="FlightWS", targetNamespace = "com.dataq7")
@SOAPBinding(style=Style.DOCUMENT, use=Use.LITERAL)
public interface FlightSEI{
    
    Reservation checkReservationByCode(@XmlElement(required=true) @WebParam(name = "code") String code) throws ArgumentException;

    ArrayList<City> getAllCities();

    ArrayList<Flight> searchFlight(@WebParam(name = "date") Long date, @WebParam(name = "cityFrom") City cityFrom, @WebParam(name = "cityTo") City cityTo)  throws ArgumentException;
   
    boolean buyTicket(@WebParam(name = "flight") Flight flight, @WebParam(name = "place") Place place, @WebParam(name = "passenger") Passenger passenger, @WebParam(name = "addInfo") String addInfo) throws ArgumentException;

}
