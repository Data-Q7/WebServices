package ws;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.ws.soap.Addressing;
import interfaces.impls.BuyImpl;
import interfaces.impls.CheckImpl;
import interfaces.impls.SearchImpl;
import interfaces.sei.FlightSEI;
import objects.Flight;
import objects.Passenger;
import objects.Reservation;
import spr.objects.City;
import spr.objects.Place;
import utils.GMTCalendar;
import ws.annotations.ExceptionMessage;
import ws.exceptions.ArgumentException;

//@MTOM
@WebService(endpointInterface = "interfaces.sei.FlightSEI")
//@BindingType(value = SOAPBinding.SOAP12HTTP_MTOM_BINDING)
//@HandlerChain(file = "FlightWS_handler.xml")
public class FlightWS implements FlightSEI {

    private SearchImpl searchImpl = new SearchImpl();
    private BuyImpl buyImpl = new BuyImpl();
    private CheckImpl checkImpl = new CheckImpl();

    @Override
    public ArrayList<Flight> searchFlight(Long date, City cityFrom, City cityTo) throws ArgumentException {

        if (date == null || date <= 0) {
            throw new ArgumentException("Дата вылета не заполнена");
        }

        checkObject(cityFrom, City.class);
        checkObject(cityTo, City.class);


        ArrayList<Flight> list = new ArrayList<>();
        Calendar c = GMTCalendar.getInstance();
        c.setTimeInMillis(date);

        list.addAll(searchImpl.searchFlight(date, cityFrom, cityTo));

        return list;
    }

    @Override
    public ArrayList<City> getAllCities() {
        ArrayList<City> list = new ArrayList<>();
        list.addAll(searchImpl.getAllCities());
        return list;
    }

    @Override
    public boolean buyTicket(Flight flight, Place place, Passenger passenger, String addInfo) throws ArgumentException {

        checkObject(flight, Flight.class);
        checkObject(passenger, Passenger.class);
        checkObject(place, Place.class);

        boolean result = buyImpl.buyTicket(flight, place, passenger, addInfo);

        return result;
    }

    @Override
    public Reservation checkReservationByCode(String code) throws ArgumentException {

        if (code == null || code.isEmpty()) {
            throw new ArgumentException("Пустой код бронирования");
        }

        return checkImpl.checkReservationByCode(code);
    }

    private void checkObject(Object object, Class<?> c) throws ArgumentException {

        if (object == null) {
            if (c.isAnnotationPresent(ExceptionMessage.class)) {
                throw new ArgumentException(c.getAnnotation(ExceptionMessage.class).message());
            }
        }

        for (Field field : c.getDeclaredFields()) {
            if (field.isAnnotationPresent(XmlElement.class)) {
                try {
                    field.setAccessible(true);
                    if (field.getAnnotation(XmlElement.class).required()
                            && (field.get(object) == null || field.get(object).equals(""))) {
                        throw new ArgumentException(field.getAnnotation(ExceptionMessage.class).message());
                    }
                } catch (IllegalArgumentException ex) {
                    Logger.getLogger(FlightWS.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IllegalAccessException ex) {
                    Logger.getLogger(FlightWS.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }
}
