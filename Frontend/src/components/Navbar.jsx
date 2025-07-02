import React from "react";
import "./Navbar.css"; // Import the CSS
import { Link } from "react-router-dom";

const Navbar = () => {
  return (
    <nav className="navbar">
      <Link to="/" className="nav-link">
        <div className="logo">Air Jordan</div>
      </Link>

      <div className="nav-links">
        <Link to="/airlines" className="nav-link">
          Airlines
        </Link>
        <Link to="/contact" className="nav-link">
          Contact
        </Link>
        <Link to="/about" className="nav-link">
          About
        </Link>
        <Link to="/tickets">
          <button className="book-btn">Manage Tickets</button>
        </Link>
      </div>
    </nav>
  );
};

export default Navbar;
