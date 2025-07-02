const express = require("express");
const router = express.Router();
const db = require("../db");
const HttpError = require("../models/http-error");

router.get("/", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM Flights");
    res.json(rows);
  } catch (err) {
    const error = new HttpError(
      "Fetching Flights failed, please try again",
      500
    );
    return next(error);
  }
});

// routes/flights.js
router.get("/:id", async (req, res, next) => {
  const flightNumber = req.params.id;
  try {
    const [flightData] = await db.query(
      "SELECT * FROM Flights WHERE FlightNumber = ?",
      [flightNumber]
    );

    const [tickets] = await db.query(
      "SELECT * FROM Tickets WHERE FlightNumber = ?",
      [flightNumber]
    );

    const passportNumbers = tickets.map((t) => t.PassportNumber);
    const placeholders = passportNumbers.map(() => "?").join(",");
    const [passengers] = passportNumbers.length
      ? await db.query(
          `SELECT * FROM Passengers WHERE PassportNumber IN (${placeholders})`,
          passportNumbers
        )
      : [[]];

    const [staffData] = await db.query(
      "SELECT * FROM FlightStaff WHERE FlightNumber = ?",
      [flightNumber]
    );

    res.json({
      flight: flightData[0],
      tickets,
      passengers,
      staff: staffData[0] || null,
    });
  } catch (err) {
    next(new HttpError("Could not fetch flight details", 500));
  }
});

module.exports = router;
