package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.object.ReportRange;
import com.example.demo.repository.AccountRepository;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;


@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    // Flight Manager
    @Autowired
    private FlightService flightService;
    @Autowired
    private AircraftService aircraftService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private AirportService airportService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private FlightRouteService flightRouteService;
    @Autowired
    private CityService cityService;
    @Autowired
    private PromotionService promotionService;
    @Autowired
    private DiscountService discountService;
    @Autowired
    private TicketTypeService ticketTypeService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private GuestService guestService;
    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private BookingService bookingService;
//-----------------------------------Home---------------------------------//
    @RequestMapping(value = "/adminHome", method = RequestMethod.GET)
    public String goToAdministratorPage() {
        return "administration/adminHome";
    }

//-----------------------------------Aircraft---------------------------------//
    // go to add new aircraft page
    @RequestMapping(value = "/addAircraft")
    public String goToAircraftAdditionPage (Model model) {
        model.addAttribute("aircraft", new Aircraft());
        model.addAttribute("brands", brandService.getAllAircraftBrands());
        model.addAttribute("type","Add");
        return "administration/addAircraft";
    }
    // Save new aircraft
    @RequestMapping(value = "/handlingAircraftAddition")
    public String handleAircraftAddition (Aircraft aircraft, Model model) {
        if(aircraftService.getAircraftById(aircraft.getAircraftId())!=null){
            if(aircraftService.isException(aircraft)){
                model.addAttribute("message","Data is existed.");
            }else {
                if(aircraftService.saveAircraft(aircraft)){
                    model.addAttribute("message","Save successed.");
                }else{
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("aircraft", aircraftService.getAircraftById(aircraft.getAircraftId()));
            model.addAttribute("brands", brandService.getAllAircraftBrands());
            model.addAttribute("type","Edit");
            return "administration/addAircraft";
        }else{
            if(aircraftService.isException(aircraft)){
                model.addAttribute("message","Data is existed.");
            }else{
                if(aircraftService.saveAircraft(aircraft)){
                    model.addAttribute("message","Save successed.");
                }else{
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("aircraft", new Aircraft());
            model.addAttribute("brands", brandService.getAllAircraftBrands());
            model.addAttribute("type","Add");
            return "administration/addAircraft";
        }
//        int totalEconomySeats = aircraft.getTotal_economy();
//        int totalBusinessSeats = aircraft.getTotal_business();
//        return "administration/addAircraft";
    }
    // go to view aircraft page
    @RequestMapping(value = "/viewAircraft")
    public String viewAircraft (Model model) {
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        return "administration/viewAircraft";
    }
    // delete aircraft
    @RequestMapping(value = "/deleteAircraft")
    public String deleteAircraft (@RequestParam(value = "aircraftId") int aircraftId,Model model) {
        if (aircraftService.deleteAircraftById(aircraftId)){
            model.addAttribute("message","Delete successfully.");
        }else{
            model.addAttribute("message","Delete failed.");
        }
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        return "administration/viewAircraft";
    }
    // go to edit aircraft page
    @RequestMapping(value = "/editAircraft")
    public String editAircraft (@RequestParam(value = "aircraftId") int aircraftId, Model model) {
        model.addAttribute("aircraft", aircraftService.getAircraftById(aircraftId));
        model.addAttribute("type", "Edit");
        model.addAttribute("brands", brandService.getAllAircraftBrands());
        return "administration/addAircraft";
    }

//-----------------------------------Flight Route---------------------------------//

    @RequestMapping(value = "/viewFlightRoute")
    public String returnListFlightRoute (Model model) {
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        return "administration/viewFlightRoute";
    }

    @RequestMapping("/addFlightRoute")
    public String gotoActionFlightRoutePage(Model model) {
        model.addAttribute("flightRoute", new FlightRoute());
        model.addAttribute("originAirport", airportService.getAllAirports());
        model.addAttribute("destinationAirport", airportService.getAllAirports());
        model.addAttribute("type","Add");
        return "administration/addFlightRoute";
    }

    @RequestMapping("/handlingSaveFlightRoute")
    public String handleSaveFlightRoute(FlightRoute flightRoute, Model model) {
        String origin = flightRoute.getOriginAirport().getAirportName();
        String destination = flightRoute.getDestinationAirport().getAirportName();
        if (origin==destination) {
            if(flightRoute.getRouteId()!=0){
                model.addAttribute("message", "Invalid value.");
                model.addAttribute("flightRoute", flightRouteService.getFlightRouteById(flightRoute.getRouteId()));
                model.addAttribute("originAirport", airportService.getAllAirports());
                model.addAttribute("destinationAirport", airportService.getAllAirports());
                model.addAttribute("type", "edit");
                return "administration/addFlightRoute";
            }
            model.addAttribute("message", "Invalid value.");
            model.addAttribute("flightRoute", new FlightRoute());
            model.addAttribute("originAirport", airportService.getAllAirports());
            model.addAttribute("destinationAirport", airportService.getAllAirports());
            return "administration/addFlightRoute";
        } else {
            for (FlightRoute f : flightRouteService.getAllFlightRoute()){
                String origin_db = f.getOriginAirport().getAirportName();
                String destination_db = f.getDestinationAirport().getAirportName();
                if(origin_db==origin&&destination_db==destination){
                    if(flightRoute.getRouteId()!=0){
                        model.addAttribute("message", "Data is existed.");
                        model.addAttribute("flightRoute", flightRouteService.getFlightRouteById(flightRoute.getRouteId()));
                        model.addAttribute("originAirport", airportService.getAllAirports());
                        model.addAttribute("destinationAirport", airportService.getAllAirports());
                        model.addAttribute("type", "edit");
                        return "administration/addFlightRoute";
                    }
                    model.addAttribute("message", "Data is existed.");
                    model.addAttribute("flightRoute", new FlightRoute());
                    model.addAttribute("originAirport", airportService.getAllAirports());
                    model.addAttribute("destinationAirport", airportService.getAllAirports());
                    return "administration/addFlightRoute";
                }
            }
            if (flightRouteService.saveFlightRoute(flightRoute)) {
                model.addAttribute("message", "Save successed.");
                model.addAttribute("flightRoute", new FlightRoute());
                model.addAttribute("originAirport", airportService.getAllAirports());
                model.addAttribute("destinationAirport", airportService.getAllAirports());
            } else {
                model.addAttribute("message", "Save failed.");
            }
            return "administration/addFlightRoute";
        }
    }
    @RequestMapping("/deleteFlightRoute")
    public String deleteFlightRoute (@RequestParam("id") int id, Model model) {
        if (flightRouteService.deleteFlightRoute(id)) {
            model.addAttribute("message", "Delete successed.");
        } else {
            model.addAttribute("message", "Delete failed.");
        }
        model.addAttribute("flightRouteList",flightRouteService.getAllFlightRoute());
        return "administration/viewFlightRoute";
    }
    @RequestMapping("/editFlightRoute")
    public String gotoActionFlightRoute (@RequestParam("id") int id, Model model) {
        model.addAttribute("flightRoute", flightRouteService.getFlightRouteById(id));
        model.addAttribute("originAirport", airportService.getAllAirports());
        model.addAttribute("destinationAirport", airportService.getAllAirports());
        model.addAttribute("type", "Edit");
        return "administration/addFlightRoute";
    }

    // End Flight Route

//-----------------------------------Flight---------------------------------//

    //go to view flight page
    @RequestMapping("/viewFlight")
    public String returnFlightList (Model model) {
        model.addAttribute("flightList", flightService.getAllFlight());
        return "administration/viewFLight";
    }
    // go to add flight page
    @RequestMapping("/addFlight")
    public String addFlight (Model model) {
        model.addAttribute("flight", new Flight());
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        model.addAttribute("brand",brandService.getAllAircraftBrands());
        model.addAttribute("type","Add");
        return "administration/addFlight";
    }
    // go to edit flight page
    @RequestMapping("/editFlight")
    public String editFlight (@RequestParam("id") int id, Model model) {
        model.addAttribute("flight", flightService.getFlightById(id));
        model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
        model.addAttribute("aircraft", aircraftService.getAllAircraft());
        model.addAttribute("type","Edit");
        return "administration/addFlight";
    }
    // delete flight
    @RequestMapping("/deleteFlight")
    public String deleteFlight (@RequestParam("id") int id, Model model) {
        if ( flightService.deleteFLight(id)){
            model.addAttribute("message", "Delete successed.");
        } else {
            model.addAttribute("message", "Delete failed.");
        }
        model.addAttribute("flightList", flightService.getAllFlight());
        return "administration/viewFLight";
    }
    // Save new Flight
    @RequestMapping("/handlingFLightAddition")
    public String handlingFLightAddition(Flight flight, Model model) {
        if(flightService.getFlightById(flight.getFlightId())!=null){
            if(flightService.isException(flight)){
                model.addAttribute("message","Invalid value OR Data is existed.");
            }else {
                if(flightService.saveFlight(flight)){
                    model.addAttribute("message","Save successed.");
                }else{
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("flight", flightService.getFlightById(flight.getFlightId()));
            model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
            model.addAttribute("aircraft", aircraftService.getAllAircraft());
            model.addAttribute("type","Edit");
            return "administration/addFlight";
        }else{
            if(flightService.isException(flight)){
                model.addAttribute("message","Invalid value OR Data is existed.");
            }else{
                if(flightService.saveFlight(flight)){
                    ticketService.createTickets(flight);
                    model.addAttribute("message","Save successed.");
                }else{
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("flight", new Flight());
            model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
            model.addAttribute("aircraft", aircraftService.getAllAircraft());
            model.addAttribute("type","Add");
            return "administration/addFlight";
        }
//        if(flightService.isException(flight))
//        {
//            model.addAttribute("message", "Invalid value OR Data is existed.");
//            model.addAttribute("flight", new Flight());
//            model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
//            model.addAttribute("aircraft", aircraftService.getAllAircraft());
//            return "administration/addFlight";
//        }else{
//            if (flightService.getFlightById(flight.getFlightId())!=null){
//                if(flightService.saveFlight(flight)){
//                    model.addAttribute("message","Save successed.");
//                }
//                else {
//                    model.addAttribute("message", "Save failed.");
//                }
//                model.addAttribute("flight", flightService.getFlightById(flight.getFlightId()));
//                model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
//                model.addAttribute("aircraft", aircraftService.getAllAircraft());
//                return "administration/addFlight";
//            }else{
//                if(flightService.saveFlight(flight)){
//                    model.addAttribute("message","Save successed.");
//                }
//                else {
//                    model.addAttribute("message", "Save failed.");
//                }
//                model.addAttribute("flight", new Flight());
//                model.addAttribute("flightRouteList", flightRouteService.getAllFlightRoute());
//                model.addAttribute("aircraft", aircraftService.getAllAircraft());
//                return "administration/addFlight";
//            }
//        }
    }
    // For Date time formatter!!!
    @InitBinder
    public void initBinder(final WebDataBinder binder) {
        final DateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss:SSS'Z'");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(timeFormat, true));
    }
    // test ajax

//-----------------------------------Brand---------------------------------//

    @RequestMapping(value = "/viewBrand")
    public String gotoViewBrandPage (Model model) {
        model.addAttribute("brandList", brandService.getAllAircraftBrands());
        return "administration/viewBrand";
    }
    @RequestMapping("/addBrand")
    public String gotoAddBrandPage(Model model) {
        model.addAttribute("brand",new Brand());
        model.addAttribute("type","Add");
        return "administration/addBrand";
    }

    @RequestMapping("/handlingSaveBrand")
    public String handlingSaveBrand(Brand brand, Model model) {
        if (brandService.getBrandById(brand.getBrandId())!=null){
            if(brandService.isException(brand)){
                model.addAttribute("message","Data is existed.");
            }else {
                if (brandService.saveBrand(brand)){
                    model.addAttribute("message","Save successed.");
                }else {
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("brand",brandService.getBrandById(brand.getBrandId()));
            model.addAttribute("type","Edit");
            return "administration/addBrand";
        }else{
            if(brandService.isException(brand)){
                model.addAttribute("message","Data is existed");
            }else {
                if (brandService.saveBrand(brand)){
                    model.addAttribute("message","Save successed.");
                }else {
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("brand",brandService.getBrandById(brand.getBrandId()));
            model.addAttribute("type","Add");
            return "administration/addBrand";
        }
    }
    @RequestMapping("/deleteBrand")
    public String deleteBrand (@RequestParam("id") int id, Model model) {
        if (brandService.deleteBrand(id)) {
            model.addAttribute("message", "Delete successed.");
        } else {
            model.addAttribute("message", "Delete failed.");
        }
        model.addAttribute("brandList",brandService.getAllAircraftBrands());
        return "administration/viewBrand";
    }
    @RequestMapping("/editBrand")
    public String gotoEditBrandPage (@RequestParam("id") int id, Model model) {
        model.addAttribute("brand", brandService.getBrandById(id));
        model.addAttribute("type", "Edit");
        return "administration/addBrand";
    }
    // End Brand

//-----------------------------------Airport---------------------------------//

    @RequestMapping(value = "/viewAirport")
    public String gotoViewAirportPage (Model model) {
        model.addAttribute("airportList", airportService.getAllAirports());
        return "administration/viewAirport";
    }
    @RequestMapping("/addAirport")
    public String gotoAddAirportPage(Model model) {
        model.addAttribute("airport",new Airport());
        model.addAttribute("cityList", cityService.getAllCities());
        model.addAttribute("type","Add");
        return "administration/addAirport";
    }

    @RequestMapping("/handlingSaveAirport")
    public String handlingSaveAirport(Airport airport, Model model) {
        if (airportService.getAirportById(airport.getAirportId())!=null){
            if(airportService.isException(airport)){
                model.addAttribute("message","Data is existed.");
            }else {
                if (airportService.saveAirport(airport)){
                    model.addAttribute("message","Save successed.");
                }else {
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("airport",airportService.getAirportById(airport.getAirportId()));
            model.addAttribute("cityList", cityService.getAllCities());
            model.addAttribute("type","Edit");
            return "administration/addAirport";
        }else{
            if(airportService.isException(airport)){
                model.addAttribute("message","Data is existed.");
            }else {
                if (airportService.saveAirport(airport)){
                    model.addAttribute("message","Save successed.");
                }else {
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("airport",airportService.getAirportById(airport.getAirportId()));
            model.addAttribute("cityList", cityService.getAllCities());
            model.addAttribute("type","Add");
            return "administration/addAirport";
        }
    }
    @RequestMapping("/deleteAirport")
    public String deleteAirport (@RequestParam("id") int id, Model model) {
        if (airportService.deleteAirport(id)) {
            model.addAttribute("message", "Delete successfully.");
        } else {
            model.addAttribute("message", "Delete failed.");
        }
        model.addAttribute("airportList",airportService.getAllAirports());
        return "administration/viewAirport";
    }
    @RequestMapping("/editAirport")
    public String gotoEditAirportPage (@RequestParam("id") int id, Model model) {
        model.addAttribute("airport", airportService.getAirportById(id));
        model.addAttribute("cityList", cityService.getAllCities());
        model.addAttribute("type", "Edit");
        return "administration/addAirport";
    }
    // End Airport
    //-----------------------------------Promotion---------------------------------//

    @RequestMapping(value = "/viewPromotion")
    public String gotoViewPromotionPage (Model model) {
        model.addAttribute("promotionList", promotionService.getAllPromotions());
        return "administration/viewPromotion";
    }
    @RequestMapping("/addPromotion")
    public String gotoAddPromotionPage(Model model) {
        model.addAttribute("promotion",new Promotion());
        model.addAttribute("type","Add");
        return "administration/addPromotion";
    }

    @RequestMapping("/handlingSavePromotion")
    public String handlingSavePromotion(Promotion promotion, Model model) {
        if (promotionService.getPromotionById(promotion.getPromotionId())!=null){
            if(promotionService.isException(promotion)){
                model.addAttribute("message","Invalid value.");
            }else {
                if (promotionService.savePromotion(promotion)){
                    model.addAttribute("message","Save successed.");
                }else {
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("promotion",promotionService.getPromotionById(promotion.getPromotionId()));
            model.addAttribute("discount",new Discount());
            model.addAttribute("promoList",promotionService.getAllPromotions());
            model.addAttribute("discountList",promotion.getDiscounts());
            model.addAttribute("type","Edit");
            return "administration/addPromotion";
        }else{
            if(promotionService.isException(promotion)){
                model.addAttribute("message","Data is existed.");
            }else {
                if (promotionService.savePromotion(promotion)){
                    model.addAttribute("message","Save successed.");
                }else {
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("promotion",new Promotion());
            model.addAttribute("type","Add");
            return "administration/addPromotion";
        }
    }
    @RequestMapping("/deletePromotion")
    public String deletePromotion (@RequestParam("id") int id, Model model) {
        if (promotionService.deletePromotion(id)) {
            model.addAttribute("message", "Delete successed.");
        } else {
            model.addAttribute("message", "Delete failed.");
        }
        model.addAttribute("promotionList",promotionService.getAllPromotions());
        return "administration/viewPromotion";
    }
    @RequestMapping("/editPromotion")
    public String gotoEditPromotionPage (@RequestParam("id") int id, Model model) {
        model.addAttribute("promotion", promotionService.getPromotionById(id));
        model.addAttribute("discount",new Discount());
        model.addAttribute("promoList",promotionService.getAllPromotions());
        model.addAttribute("discountList", promotionService.getPromotionById(id).getDiscounts());
        model.addAttribute("type", "Edit");
        return "administration/addPromotion";
    }
    @RequestMapping("/handlingSaveDiscount")
    public String saveDiscount(Discount discount){
        discountService.saveDiscount(discount);
        return "redirect:/admin/editPromotion?id=" + discount.getPromotion().getPromotionId();
    }
    @RequestMapping("/deleteDiscount")
    public String deleteDiscount(@RequestParam("id") int id){
        discountService.deleteDiscount(promotionService.getPromotionById(id).getDiscounts().get(0).getDiscountId());
        return "redirect:/admin/editPromotion?id=" + id;
    }
    // End Promotion
//-----------------------------------TicketType---------------------------------//

    @RequestMapping(value = "/viewTicketType")
    public String gotoViewTicketTypePage (Model model) {
        model.addAttribute("ticketTypeList", ticketTypeService.getAllTicketTypes());
        return "administration/viewTicketType";
    }
    @RequestMapping("/addTicketType")
    public String gotoAddTicketTypePage(Model model) {
        model.addAttribute("ticketType",new TicketType());
        model.addAttribute("type","Add");
        return "administration/addTicketType";
    }

    @RequestMapping("/handlingSaveTicketType")
    public String handlingSaveTicketType(TicketType ticketType, Model model) {
        if (ticketTypeService.getTicketTypeById(ticketType.getTicketTypeId())!=null){
            if(ticketTypeService.isException(ticketType)){
                model.addAttribute("message","Data is existed.");
            }else {
                if (ticketTypeService.saveTicketType(ticketType)){
                    model.addAttribute("message","Save successed.");
                }else {
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("ticketType",ticketTypeService.getTicketTypeById(ticketType.getTicketTypeId()));
            model.addAttribute("type","Edit");
            return "administration/addTicketType";
        }else{
            if(ticketTypeService.isException(ticketType)){
                model.addAttribute("message","Data is existed");
            }else {
                if (ticketTypeService.saveTicketType(ticketType)){
                    model.addAttribute("message","Save successed.");
                }else {
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("ticketType", new TicketType());
            model.addAttribute("type","Add");
            return "administration/addTicketType";
        }
    }
    @RequestMapping("/deleteTicketType")
    public String deleteTicketType (@RequestParam("id") int id, Model model) {
        if (ticketTypeService.deleteTicketType(id)) {
            model.addAttribute("message", "Delete successed.");
        } else {
            model.addAttribute("message", "Delete failed.");
        }
        model.addAttribute("ticketTypeList",ticketTypeService.getAllTicketTypes());
        return "administration/viewBrand";
    }
    @RequestMapping("/editTicketType")
    public String gotoEditTicketTypePage (@RequestParam("id") int id, Model model) {
        model.addAttribute("ticketType", ticketTypeService.getTicketTypeById(id));
        model.addAttribute("type", "Edit");
        return "administration/addTicketType";
    }
    // End TicketType
//-----------------------------------Account---------------------------------//
    @RequestMapping(value = "/viewAccount")
    public String gotoViewAccountPage (Model model) {
        model.addAttribute("accountList", accountService.getAllAccounts());
        return "administration/viewAccount";
    }
    @RequestMapping("/addAccount")
    public String gotoAddAccountPage(Model model) {
        model.addAttribute("account",new Account());
        model.addAttribute("roles", userRoleService.getAllRoles());
        model.addAttribute("type","Add");
        return "administration/addAccount";
    }
    @RequestMapping("/handlingSaveAccount")
    public String handlingSaveAccount(Account account, Model model) {
        if (accountService.getAccountById(account.getAccountId())!=null){
            if(accountService.isException(account)){
                model.addAttribute("message","Data is existed.");
            }else {
                if (accountService.saveAccount(account)){
                    model.addAttribute("message","Save successed.");
                }else {
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("account",accountService.getAccountById(account.getAccountId()));
            if (accountService.getAccountById(account.getAccountId()).getGuest()!=null){
                model.addAttribute("guest", accountService.getAccountById(account.getAccountId()).getGuest());
            }else model.addAttribute("guest", new Guest());
            model.addAttribute("roles", userRoleService.getAllRoles());
            model.addAttribute("type","Edit");
            return "administration/addAccount";
        }else{
            if(accountService.isException(account)){
                model.addAttribute("message","Data is existed.");
            }else {
                if (accountService.saveAccount(account)){
                    model.addAttribute("message","Save successed.");
                }else {
                    model.addAttribute("message","Save failed.");
                }
            }
            model.addAttribute("account",new Account());
            model.addAttribute("roles", userRoleService.getAllRoles());
            model.addAttribute("type","Add");
            return "administration/addAccount";
        }
    }
    @RequestMapping("/deleteAccount")
    public String deleteAccount (@RequestParam("id") int id, Model model) {
        if (accountService.deleteAccount(id)) {
            model.addAttribute("message", "Delete successed.");
        } else {
            model.addAttribute("message", "Delete failed.");
        }
        model.addAttribute("accountlist",accountService.getAllAccounts());
        return "administration/viewAccount";
    }
    @RequestMapping("/editAccount")
    public String gotoEditAccountPage (@RequestParam("id") int id, Model model) {
        model.addAttribute("account", accountService.getAccountById(id));
        if (accountService.getAccountById(id).getGuest()!=null){
            model.addAttribute("guest", accountService.getAccountById(id).getGuest());
        }else model.addAttribute("guest", new Guest());
        model.addAttribute("roles", userRoleService.getAllRoles());
        model.addAttribute("type", "Edit");
        return "administration/addAccount";
    }
    @RequestMapping("/handlingSaveGuest")
    public String saveGuest(Guest guest){
        guestService.saveGuest(guest);
        return "redirect:/admin/editAccount?id="+guest.getAccount().getAccountId();
    }
    // End Account

    /*Manage booking*/
    @RequestMapping(value = "/viewBookingData", method = RequestMethod.GET)
    public String goToBookingDataPage (Model model) {
        model.addAttribute("bookingList",bookingService.getAllBookingsData());
        model.addAttribute("reportRange", new ReportRange());
        return "administration/viewBookings";
    }
    @RequestMapping(value = "/bookingReport", method = RequestMethod.GET)
    public String goToBookingReportPage (Model model, ReportRange reportRange) {
        List<Booking> bookings = bookingService.getAllBookingsByPaymentDateBetween(reportRange.getStartDate(), reportRange.getEndDate());

        double totalPrice = 0;

        for (Booking b: bookings) {
            totalPrice += b.getPayment().getTotalPayment();
        }
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("bookings", bookings);
        model.addAttribute("reportRange", new ReportRange());
        return "administration/booking-report";
    }
    @RequestMapping(value = "/deleteBooking", method = RequestMethod.GET)
    public String rejectBookingData (@RequestParam("bookingId") int bookingId, Model model) {
        //Delete Ticket
        boolean ticketDeleteState = ticketService.resetTicketValuesByBookingId(bookingId);
        boolean bookingDeleteState = bookingService.deleteBookingByBookingId(bookingId);
        if (ticketDeleteState && bookingDeleteState) {
                model.addAttribute("message", "Delete successfully.");
            } else {
                model.addAttribute("message", "Delete failed.");
        }
        model.addAttribute("bookingList",bookingService.getAllBookingsData());
        model.addAttribute("reportRange", new ReportRange());
        return "administration/viewBookings";
    }
    @RequestMapping(value = "/viewABookingDetails", method = RequestMethod.GET)
    public String viewABookingDetails (@RequestParam("bookingId") int bookingId, Model model) {
        Booking booking = bookingService.getBookingByBookingId(bookingId);
        model.addAttribute("bookingDetails", booking);
        return "administration/viewBookingDetails";
    }
    // End Account
}

