package ws;

import java.util.ArrayList;
import java.util.Calendar;
import javax.jws.WebService;
import javax.xml.ws.BindingType;
import javax.xml.ws.soap.MTOM;
import javax.xml.ws.soap.SOAPBinding;
import interfaces.Buy;
import interfaces.Check;
import interfaces.Search;
import interfaces.impls.BuyImpl;
import interfaces.impls.CheckImpl;
import interfaces.impls.SearchImpl;
import objects.Flight;
import objects.Passenger;
import objects.Reservation;
import spr.objects.City;
import spr.objects.Place;
import utils.GMTCalendar;


@MTOM
@WebService(serviceName = "SearchWS")
@BindingType(value = SOAPBinding.SOAP12HTTP_MTOM_BINDING)
public class SearchWS implements Search, Buy, Check {

    private SearchImpl searchImpl = new SearchImpl();
    private BuyImpl buyImpl = new BuyImpl();
    private CheckImpl checkImpl = new CheckImpl();

    @Override
    public ArrayList<Flight> searchFlight(long date, City cityFrom, City cityTo) {

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
    public boolean buyTicket(Flight flight, Place place, Passenger passenger, String addInfo) {
        boolean result = false;

        result = buyImpl.buyTicket(flight, place, passenger, addInfo);

        return result;
    }

    @Override
    public Reservation checkReservationByCode(String code) {
        return checkImpl.checkReservationByCode(code);
    }
}
