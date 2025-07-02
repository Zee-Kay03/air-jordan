// src/components/pages/AirlinesPage.jsx
import React, { useEffect, useState } from "react";
import axios from "axios";
import "./AirlinesPage.css";

const AirlinesPage = () => {
  const [airlines, setAirlines] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    axios
      .get("http://localhost:3000/airlines")
      .then((response) => {
        setAirlines(response.data);
        setLoading(false);
      })
      .catch((error) => {
        setError("Failed to load airlines. Please try again.");
        setLoading(false);
      });
  }, []);

  if (loading) return <div className="loader">Loading Airlines...</div>;
  if (error) return <div className="error">{error}</div>;

  return (
    <div className="airlines-wrapper">
      <h1>Our Partner Airlines</h1>
      <div className="airlines-grid">
        {airlines.map((airline) => (
          <div className="airline-card" key={airline.AirlineCode}>
            <h2>{airline.Name}</h2>
            <p>
              <strong>Code:</strong> {airline.AirlineCode}
            </p>
            <p>
              <strong>Country:</strong> {airline.Country}
            </p>
            <p>
              <strong>Contact:</strong> {airline.ContactInfo}
            </p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default AirlinesPage;
