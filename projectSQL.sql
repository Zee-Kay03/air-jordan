use airportmanagement;

SELECT * FROM airlines;

SELECT * FROM Flights;

SELECT * FROM Flightstaff;

SELECT * FROM Passengers;

SELECT * FROM Tickets;

INSERT INTO Tickets (TicketID, PassportNumber, FlightNumber, SeatNumber, BookingDate, PaymentStatus)
VALUES
  ('T110', 'P1010', 'FL101', '11A', '2025-06-19', 'Paid'),
  ('T111', 'P1003', 'FL102', '15B', '2025-06-20', 'Pending'),
  ('T112', 'P1005', 'FL103', '6C', '2025-06-21', 'Paid'),
  ('T113', 'P1002', 'FL104', '21D', '2025-06-22', 'Paid'),
  ('T114', 'P1001', 'FL105', '23E', '2025-06-23', 'Pending'),
  ('T115', 'P1008', 'FL106', '19F', '2025-06-24', 'Paid'),
  ('T116', 'P1009', 'FL107', '8A', '2025-06-25', 'Paid'),
  ('T117', 'P1006', 'FL108', '10B', '2025-06-26', 'Pending'),
  ('T118', 'P1007', 'FL109', '3C', '2025-06-27', 'Paid');
  
  INSERT INTO Airlines (AirlineCode, Name, ContactInfo, Country)
VALUES
  ('FRN9', 'Frontier Airlines', 'support@flyfrontier.com', 'USA'),
  ('VST2', 'Vistara', 'contact@airvistara.com', 'India'),
  ('AUS3', 'Austrian Airlines', 'info@austrian.com', 'Austria');
  
  
  DELETE FROM Airlines WHERE AirlineCode = 'AUS3';

