package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.FlightDB;
import database.PassengerDB;
import database.PlaceDB;
import database.ReservationDB;
import objects.Flight;
import objects.Passenger;
import objects.Reservation;
import spr.objects.Place;

@WebServlet(name = "TestSearch", urlPatterns = {"/TestSearch"})
public class TestSearch extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Flight flight = FlightDB.getInstance().executeObject(FlightDB.getInstance().getObjectByID(1));

            Place place = PlaceDB.getInstance().executeObject(PlaceDB.getInstance().getObjectByID(2));

            Passenger passenger = PassengerDB.getInstance().executeObject(PassengerDB.getInstance().getObjectByID(1));

            Calendar date = Calendar.getInstance();
            date.setTimeInMillis(1328418000000L);

            Reservation reserv = new Reservation();
            reserv.setAddInfo("Без обеда");
            reserv.setCode(UUID.randomUUID().toString());
            reserv.setPassenger(passenger);
            reserv.setReserveDateTime(date);
            reserv.setPlace(place);
            reserv.setFlight(flight);

//            ReservationDB.getInstance().insert(ReservationDB.getInstance().getInsertStmt(reserv));

            reserv = ReservationDB.getInstance().executeObject(ReservationDB.getInstance().getStmtByCode("8b625c44-d0c7-4f0e-ad25-7f1f28172a45"));
            System.out.println(reserv.getFlight().getAircraft().getName());

            Calendar c = Calendar.getInstance();
            c.setTimeInMillis(1328645700000L);

            reserv = ReservationDB.getInstance().executeObject(ReservationDB.getInstance().getStmtByDateReserv(date));
            System.out.println(reserv.getFlight().getAircraft().getName());

            reserv = ReservationDB.getInstance().executeObject(ReservationDB.getInstance().getStmtByDocumentNumber("AG2131"));
            System.out.println(reserv.getFlight().getAircraft().getName());

            reserv = ReservationDB.getInstance().executeObject(ReservationDB.getInstance().getStmtByFamilyName("Family"));
            System.out.println(reserv.getFlight().getAircraft().getName());


        } catch (SQLException ex) {
            Logger.getLogger(TestSearch.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
