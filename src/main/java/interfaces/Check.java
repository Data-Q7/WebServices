package interfaces;

import objects.Reservation;

public interface Check {

    Reservation checkReservationByCode(String code);
}
