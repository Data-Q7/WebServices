package interfaces;

import objects.Flight;
import objects.Reservation;
import spr.objects.Place;



public interface Buy {
    
    Reservation buyTicket(Flight flight, Place place, String addInfo);

}
