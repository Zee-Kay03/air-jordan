import React from "react";
import { Swiper, SwiperSlide } from "swiper/react";
import { Autoplay } from "swiper/modules";
import "swiper/css";
import "swiper/css/autoplay";

const images = ["/air1.jpg", "/air2.jpg", "/air3.jpg", "/air4.jpg"];

const Carousel = () => {
  return (
    <div style={{ position: "relative", height: 650 }}>
      {/* Overlay Text */}
      <div
        style={{
          position: "absolute",
          zIndex: 10,
          top: "30%",
          left: "8%",
          color: "white",
          fontSize: "2.5rem",
          fontWeight: "600",
          maxWidth: "40%",
          fontFamily: "Poppins, sans-serif",
        }}
      >
        <div style={{ marginBottom: "4rem" }}>Welcome to Air Jordan</div>
        <div style={{ fontSize: "2.5rem", lineHeight: "1.4" }}>
          Experience effortless travel,
          <br />
          from takeoff to touchdown.
        </div>
      </div>

      {/* Gradient */}
      <div
        style={{
          position: "absolute",
          zIndex: 5,
          width: "100%",
          height: "100%",
          background:
            "linear-gradient(to right, rgba(141, 11, 11, 0.5), rgba(38, 9, 2, 0.3), rgba(38, 9, 2, 0.3))",
        }}
      />

      {/* Swiper Carousel */}
      <Swiper
        modules={[Autoplay]}
        spaceBetween={30}
        slidesPerView={1}
        loop={true}
        autoplay={{ delay: 4000, disableOnInteraction: false }}
        style={{ height: "100%" }}
      >
        {images.map((src, idx) => (
          <SwiperSlide key={idx}>
            <img
              src={src}
              alt={`slide-${idx}`}
              style={{ width: "100%", height: "100%", objectFit: "cover" }}
            />
          </SwiperSlide>
        ))}
      </Swiper>
    </div>
  );
};

export default Carousel;
