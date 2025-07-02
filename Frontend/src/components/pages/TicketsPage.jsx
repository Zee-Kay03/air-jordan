// src/components/pages/TicketsPage.jsx
import React, { useEffect, useState } from "react";
import axios from "axios";
import "./TicketsPage.css";

const TicketsPage = () => {
  const [tickets, setTickets] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    axios
      .get("http://localhost:3000/tickets")
      .then((response) => {
        setTickets(response.data);
        setLoading(false);
      })
      .catch(() => {
        setError("Failed to fetch tickets. Please try again later.");
        setLoading(false);
      });
  }, []);

  if (loading) return <div className="loader">Loading Tickets...</div>;
  if (error) return <div className="error">{error}</div>;

  return (
    <div className="tickets-wrapper">
      <h1>Manage Your Tickets</h1>
      <div className="tickets-grid">
        {tickets.map((ticket) => (
          <div className="ticket-card" key={ticket.TicketID}>
            <h2>Ticket #{ticket.TicketID}</h2>
            <p>
              <strong>Passport:</strong> {ticket.PassportNumber}
            </p>
            <p>
              <strong>Flight:</strong> {ticket.FlightNumber}
            </p>
            <p>
              <strong>Seat:</strong> {ticket.SeatNumber}
            </p>
            <p>
              <strong>Date:</strong> {ticket.BookingDate}
            </p>
            <p>
              <strong>Status:</strong>{" "}
              <span
                className={ticket.PaymentStatus === "Paid" ? "paid" : "pending"}
              >
                {ticket.PaymentStatus}
              </span>
            </p>
            <div className="ticket-actions">
              <button className="cancel-btn">Cancel Ticket</button>
              <button className="edit-btn">Edit</button>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default TicketsPage;
