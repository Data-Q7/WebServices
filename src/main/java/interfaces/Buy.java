package interfaces;

import objects.Flight;
import objects.Passenger;
import spr.objects.Place;



public interface Buy {
    
    boolean buyTicket(Flight flight, Place place, Passenger passenger, String addInfo);

}
