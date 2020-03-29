package interfaces.impls;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import database.ReservationDB;
import interfaces.Check;
import objects.Reservation;


public class CheckImpl implements Check{

    private ReservationDB reservDB = ReservationDB.getInstance();

    @Override
    public Reservation checkReservationByCode(String code) {
        Reservation reserv = null;
        try {
            reserv = reservDB.executeObject(reservDB.getStmtByCode(code));
        } catch (SQLException ex) {
            Logger.getLogger(CheckImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return reserv;
    }
}
