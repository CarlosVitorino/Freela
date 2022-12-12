import React from "react";

export default function Client() {
  return (
    <span
      role="img"
      aria-label="user"
      class="anticon anticon-user ant-menu-item-icon"
    >
      <svg
        width="2em"
        height="2em"
        viewBox="0 0 96 96"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <rect
          x="18"
          y="18"
          width="68"
          height="68"
          fill="black"
          stroke="black"
          stroke-width="4"
          stroke-linejoin="round"
        />
        <rect
          x="10"
          y="10"
          width="68"
          height="68"
          fill="#DD7DFF"
          stroke="black"
          stroke-width="4"
          stroke-linejoin="round"
        />
        <circle cx="44" cy="44" r="8" fill="black" />
      </svg>
    </span>
  );
}
