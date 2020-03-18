package interfaces.impls;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import interfaces.Search;
import objects.Flight;
import spr.objects.City;

public class SearchImpl implements Search {

    @Override
    public List<Flight> searchFlight(Date date, City cityFrom, City cityTo, int placeCount) {
        
        ArrayList<Flight> list = new ArrayList<>();
       
        
        return list;
    }
    
    private boolean hasFreePlaces(Flight flight){
        return true;
    }

    
}
