package interfaces;

import java.util.Date;
import java.util.List;
import spr.objects.City;
import objects.Flight;



public interface Search {
    
    List<Flight> searchFlight(Date date, City cityFrom, City cityTo, int placeCount);  

}
