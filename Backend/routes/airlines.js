const express = require("express");
const router = express.Router();
const db = require("../db");
const HttpError = require("../models/http-error");

router.get("/", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT * FROM Airlines");
    res.json(rows);
  } catch (err) {
    const error = new HttpError(
      "Fetching Flights failed, please try again",
      500
    );
    return next(error);
  }
});

module.exports = router;
