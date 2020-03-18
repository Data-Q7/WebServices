package interfaces;

import objects.Flight;
import spr.objects.City;

import java.util.Date;
import java.util.List;


public interface Search {

    List<Flight> searchFlight(Date date, City cityFrom, City cityTo, int placeCount);

}
