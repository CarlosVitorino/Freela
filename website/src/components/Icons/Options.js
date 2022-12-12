import React from "react";

export default function Options() {
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
          fill="#FFB443"
          stroke="black"
          stroke-width="4"
          stroke-linejoin="round"
        />
        <path d="M33 64L33 24" stroke="black" stroke-width="6" />
        <path d="M55 64L55 24" stroke="black" stroke-width="6" />
        <rect x="48" y="24" width="14" height="14" fill="black" />
        <rect x="26" y="42" width="14" height="14" fill="black" />
      </svg>
    </span>
  );
}
