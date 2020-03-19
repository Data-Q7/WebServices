package interfaces;

import java.util.ArrayList;
import objects.Flight;
import spr.objects.City;



public interface Search {
    
    ArrayList<Flight> searchFlight(long date, City cityFrom, City cityTo);  

}
