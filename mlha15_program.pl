%!
% Author         : Mathias Lundhede Hansen
% Mail           : mlha15@student.aau.dk
% Student number : 20154238
%!

%!
% Facts
%!

passenger("Mathias", "Hansen", "070195").
country("Canada").
country("Denmark").
iata("YYZ").
iata("BIL").
city("Toronto").
city("Billund").
airport("YYZ", "Toronto Pearson Airport", "Toronto", "Canada").
airport("BIL", "Billund Airport", "Billund", "Denmark").
weather("YYZ", "Thunderstorm").
weather("BIL", "Clear").
visaagreement("Denmark", "Canada").
passport("Mathias", "Hansen", "070195", "Denmark").



%!
% Predicates
%!

country(name).
airport(IATA, Name, City, C) :- country(C), iata(IATA), city(City).
weather(IATA, Weather) :- iata(IATA).
visaagreement(X, Y) :- country(X), country(Y).
passenger(Name, LastName, Birthdate).
passport(PName, PLastName, PBirthdate, Country) :- passenger(PName, PLastName, PBirthdate), country(Country).


airportstoflyto(PName, PLastName, PBirthdate, X) :- passenger(PName, PLastName, PBirthdate),passport(PName, PLastName, PBirthdate, Country), airport(M, X, N, B).



checkweather(X, R, T) :- airport(X, R), weather(X, T).
