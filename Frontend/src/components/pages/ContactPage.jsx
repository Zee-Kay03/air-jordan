// components/pages/ContactPage.jsx
import React from "react";
import "./PageStyles.css";

const ContactPage = () => {
  return (
    <div className="page-wrapper">
      <div className="page-container">
        <h1>Contact Us</h1>
        <p>Have questions, feedback, or need help? We’re here for you.</p>
        <p>
          <strong>Email:</strong> support@airjordan.com
        </p>
        <p>
          <strong>UAN:</strong> +92-311-111-2222
        </p>
        <p>
          Our support team is available 24/7 to assist with bookings, flight
          updates, or any other queries related to your travel experience.
        </p>
      </div>
    </div>
  );
};

export default ContactPage;
