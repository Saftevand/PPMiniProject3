%!
% Author         : Mathias Lundhede Hansen
% Mail           : mlha15@student.aau.dk
% Student number : 20154238
%!

%!
% Facts
%!

country("Canada").
country("Denmark").

iata("YYZ").
iata("BIL").

city("Toronto").
city("Billund").

airport("YYZ", "Toronto", "Canada").
airport("BIL", "Billund", "Denmark").
airport("LAX", "Los Angeles", "USA").

weather("YYZ", "Thunderstorm").
weather("BIL", "Clear").

passenger("Mathias", "Hansen", "070195").
passport("Mathias", "Hansen", "070195", "Denmark").

visaagreement("Denmark", "Canada").

reservation("AAA", "Mathias", "Hansen", "070195", "BIL", "YYZ", "1A").
reservation("BBB", "Mathias", "Hansen", "070195", "YYZ", "LAX", "9Z").
reservation("CCC", "Mathias", "Hansen", "070195", "BIL", "YYZ", "4F").




%!
% Predicates
%!

country(name).
airport(IATA, City, Country) :-
    country(Country),
    iata(IATA),
    city(City).
weather(IATA, Weather) :-
    iata(IATA).
visaagreement(X, Y) :-
    country(X),
    country(Y).
passenger(Name, LastName, Birthdate).
passport(PName, PLastName, PBirthdate, Country) :-
    passenger(PName, PLastName, PBirthdate),
    country(Country).
reservation(BookingCode, Pname, Plastname, Pbirthdate, FromAirport, ToAirport, SeatNumber) :-
    passenger(Pname, Plastname, Pbirthdate),
    iata(FromAirport),
    iata(ToAirport).




airports_to_fly_to(PName, PLastName, PBirthdate, Destination) :-
    passenger(PName, PLastName, PBirthdate),
    passport(PName, PLastName, PBirthdate, FromCountry),
    airport(Destination, City, ToCountry),
    visaagreement(FromCountry, ToCountry).

compute_illigal_reservations(Pname, Plastname, Pbirthdate) :-
    passenger(Pname, Plastname, Pbirthdate),
    reservation(Bookingcode, Pname, Plastname, Pbirthdate,  FromAirport, ToAirport, SeatNumber),
    passport(Pname, Plastname, Pbirthdate, FromCountry),
    airport(ToAirport, City, ToCountry),
    not(visaagreement(FromCountry, ToCountry)).




checkweather(X, R, T) :- airport(X, R), weather(X, T).



%! ['E:/Repositories/P7/PPMiniProject3/mlha15_program.pl'].
%!
