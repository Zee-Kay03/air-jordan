// src/pages/FlightPage.jsx
import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";
import "./FlightPage.css";

const FlightPage = () => {
  const { id } = useParams(); // FlightNumber
  const [flightDetails, setFlightDetails] = useState(null);
  const [tickets, setTickets] = useState([]);
  const [passengers, setPassengers] = useState([]);
  const [staff, setStaff] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    axios
      .get(`http://localhost:3000/flights/${id}`)
      .then((res) => {
        const { flight, tickets, passengers, staff } = res.data;
        setFlightDetails(flight);
        setTickets(tickets);
        setPassengers(passengers);
        setStaff(staff);
        setLoading(false);
      })
      .catch(() => setLoading(false));
  }, [id]);

  if (loading) return <div className="loader">Loading flight data...</div>;

  return (
    <div className="flight-page">
      <h1>Flight {flightDetails.FlightNumber} Details</h1>
      <div className="flight-info">
        <p>
          <strong>From:</strong> {flightDetails.DepartureAirport}
        </p>
        <p>
          <strong>To:</strong> {flightDetails.ArrivalAirport}
        </p>
        <p>
          <strong>Departure:</strong> {flightDetails.DepartureTime}
        </p>
        <p>
          <strong>Arrival:</strong> {flightDetails.ArrivalTime}
        </p>
        <p>
          <strong>Status:</strong> {flightDetails.Status}
        </p>
        <p>
          <strong>Airline:</strong> {flightDetails.AirlineCode}
        </p>
        <p>
          <strong>Staff Assigned:</strong> {staff ? staff.EmployeeID : "None"}
        </p>
      </div>

      <h2>Passengers</h2>
      <table className="table">
        <thead>
          <tr>
            <th>Ticket ID</th>
            <th>Passenger</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Seat</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          {tickets.map((ticket, idx) => (
            <tr key={ticket.TicketID}>
              <td>{ticket.TicketID}</td>
              <td>{passengers[idx]?.Name}</td>
              <td>{passengers[idx]?.Email}</td>
              <td>{passengers[idx]?.PhoneNumber}</td>
              <td>{ticket.SeatNumber}</td>
              <td>{ticket.PaymentStatus}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default FlightPage;
