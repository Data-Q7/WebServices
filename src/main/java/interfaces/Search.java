package interfaces;

import java.util.Date;
import java.util.List;
import objects.Flight;
import spr.objects.City;



public interface Search {
    
    List<Flight> searchFlight(Date date, City cityFrom, City cityTo, int placeCount);  

}
