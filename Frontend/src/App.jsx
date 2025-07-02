import "./App.css";
import Navbar from "./components/Navbar";
import Carousel from "./components/Carousel";
import FlightsList from "./components/FlightsList";
import { Routes, Route, useLocation } from "react-router-dom";
import AboutPage from "./components/pages/AboutPage";
import ContactPage from "./components/pages/ContactPage";
import AirlinesPage from "./components/pages/AirlinesPage";
import TicketsPage from "./components/pages/TicketsPage";
import FlightPage from "./components/pages/FlightPage";

function App() {
  const location = useLocation();
  const showCarousel = location.pathname === "/";

  return (
    <>
      <Navbar />
      {showCarousel && <Carousel />}

      <Routes>
        <Route path="/" element={<FlightsList />} />

        <Route path="/about" element={<AboutPage />} />
        <Route path="/contact" element={<ContactPage />} />
        <Route path="/airlines" element={<AirlinesPage />} />
        <Route path="/tickets" element={<TicketsPage />} />
        <Route path="/flights/:id" element={<FlightPage />} />
      </Routes>
    </>
  );
}

export default App;
