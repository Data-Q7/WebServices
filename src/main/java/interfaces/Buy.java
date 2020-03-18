package interfaces;

import objects.Flight;
import spr.objects.Place;
import objects.Reservation;



public interface Buy {
    
    Reservation buyTicket(Flight flight, Place place, String addInfo);

}
