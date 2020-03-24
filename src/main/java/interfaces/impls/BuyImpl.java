package interfaces.impls;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import database.PassengerDB;
import database.ReservationDB;
import interfaces.Buy;
import objects.Flight;
import objects.Passenger;
import objects.Reservation;
import spr.objects.Place;
import utils.GMTCalendar;


public class BuyImpl implements Buy {
    
    private ReservationDB reservDB = ReservationDB.getInstance();
    private PassengerDB passengerDB = PassengerDB.getInstance();

    @Override
    public boolean buyTicket(Flight flight, Place place, Passenger passenger, String addInfo) {

        try {

            Reservation reserv = new Reservation();
            reserv.setAddInfo(addInfo);
            reserv.setCode(UUID.randomUUID().toString());
            reserv.setPassenger(passenger);

            Calendar c = GMTCalendar.getInstance();
            reserv.setReserveDateTime(c);

            reserv.setPlace(place);
            reserv.setFlight(flight);

            // желательно реализовать обе операции в одной транзакции
            int id = passengerDB.insert(passengerDB.getInsertStmt(passenger));
            passenger.setId(id);
            
            reservDB.insert(reservDB.getInsertStmt(reserv));

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(BuyImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
}
