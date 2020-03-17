package main;

import java.util.ArrayList;
import interfaces.impls.SearchImpl;
import interfaces.impls.TestVars;
import objects.Flight;

public class Start {

    public static void main(String[] args) {

        SearchImpl searchImpl = new SearchImpl();
        ArrayList<Flight> flightList = new ArrayList<>(); 
        flightList.addAll(searchImpl.searchFlight(TestVars.calendar1.getTime(), TestVars.city2, TestVars.city1, 1));
        
        System.out.println(flightList.size());

        

    }
    
    
    
}
